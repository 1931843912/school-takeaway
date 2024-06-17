<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="菜品名称" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入菜品名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option v-for="dict in dict.type.sys_normal_disable" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['system:dish:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['system:dish:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['system:dish:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['system:dish:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dishList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="菜品名称" align="center" prop="name" />
      <el-table-column label="菜品分类名称" align="center" prop="categoryName" />
      <el-table-column label="菜品价格" align="center" prop="price">
        <template slot-scope="scope">
          <span>￥{{ (scope.row.price) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="图片" align="center" prop="image" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50" />
        </template>
      </el-table-column>
      <!-- <el-table-column label="描述信息" align="center" prop="description" /> -->
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="createUser" />
      <el-table-column label="修改人" align="center" prop="updateUser" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['system:dish:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['system:dish:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改菜品对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="菜品名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入菜品名称" />
        </el-form-item>
        <el-form-item label="菜品价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入菜品价格" />
        </el-form-item>
        <!-- 菜品分类 -->
        <el-form-item label="套餐分类" prop="categoryId">
          <!-- 使用下拉框形式 -->
          <el-select v-model="form.categoryId" placeholder="请选择套餐分类">
            <el-option v-for="dict in categoryList" :key="dict.id" :label="dict.name" :value="dict.id"></el-option>
          </el-select>
        </el-form-item>
        <!-- 添加一个按钮用于添加父节点 -->
        <el-form-item label="口味">
          <el-button type="primary" size="small" @click="addParent">添加父节点</el-button>
        </el-form-item>
        <el-form-item label="口味" prop="flavors">
          <el-tree :data="data" node-key="id" default-expand-all :expand-on-click-node="false"
            :render-content="renderContent">
          </el-tree>
        </el-form-item>
        <el-form-item label="图片" prop="image">
          <image-upload v-model="form.image" />
        </el-form-item>
        <el-form-item label="描述信息">
          <editor v-model="form.description" :min-height="192" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in dict.type.sys_normal_disable" :key="dict.value" :label="parseInt(dict.value)">{{
              dict.label }}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<style scoped>
.el-tag+.el-tag {
  margin-left: 10px;
}

.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}

.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}

.custom-tree-node {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
}
</style>
<script>
import { listDish, getDish, delDish, addDish, updateDish } from "@/api/merchant/dish/index";
import { listCategory } from '@/api/merchant/category/index'
import { getDishFlavors } from "../../../api/merchant/dish";
let id = 1000;
export default {
  name: "Dish",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 菜品表格数据
      dishList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        status: null,
      },
      //分类列表
      categoryList: [],
      // dynamicTags: ['标签一', '标签二', '标签三'],
      dynamicTags: [],
      inputVisible: false,
      inputValue: '',
      addFlavors: [{
        id: 1,
        label: '辣度',
        children: []
      }, {
        id: 2,
        label: '温度',
        children: []
      }, {
        id: 3,
        label: '忌口',
        children: []
      }, {
        id: 5,
        label: '甜味',
        children: []
      }],
      data: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "菜品名称不能为空", trigger: "blur" }
        ],
        price: [
          { required: true, message: "菜品价格不能为空", trigger: "blur" }
        ],
        image: [
          { required: true, message: "图片不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "状态不能为空", trigger: "blur" }
        ],
        categoryId: [
          { required: true, message: "分类不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getCategoryList();
  },
  methods: {
    /** 查询菜品列表 */
    getList() {
      this.loading = true;
      listDish(this.queryParams).then(response => {
        this.dishList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 查询分类列表
    getCategoryList() {
      this.loading = true;
      listCategory(this.queryParams).then(response => {
        this.categoryList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleClose(tag) {
      this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
    },
    showInput() {
      this.inputVisible = true;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },
    handleInputConfirm() {
      let inputValue = this.inputValue;
      if (inputValue) {
        this.dynamicTags.push(inputValue);
      }
      this.inputVisible = false;
      this.inputValue = '';
    },
    getPromptValue() {
      return new Promise((resolve, reject) => {
        this.$prompt('请输入口味', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputPattern: /[\w\u4e00-\u9fa5\-]{1,10}/,
          inputErrorMessage: '口味不合法'
        }).then(({ value }) => {
          resolve(value);
        }).catch(() => {
          reject('取消输入');
        });
      });
    },
    async append(data) {
      try {
        const newLabel = await this.getPromptValue();
        if (newLabel) {
          // 创建新的口味对象
          const newFlavor = { id: id++, label: newLabel };
          //添加数据
          data.children.push(newFlavor);
        }
      } catch (error) {
        this.$message({
          type: 'info',
          message: error
        });
      }
    },
    async addParent() {
      try {
        const newLabel = await this.getPromptValue();
        if (newLabel) {
          // 创建新的口味对象
          const newFlavor = { id: id++, label: newLabel, children: [] };
          //添加数据
          this.data.push(newFlavor);
        }
      } catch (error) {
        this.$message({
          type: 'info',
          message: error
        });
      }
    },
    remove(node, data) {
      const parent = node.parent;
      const children = parent.data.children || parent.data;
      const index = children.findIndex(d => d.id === data.id);
      children.splice(index, 1);
    },
    renderContent(h, { node, data, store }) {
      // 只有父亲节点展示添加按钮 子节点只有删除功能
      if (data.children) {
        return (
          <span class="custom-tree-node">
            <span>{node.label}</span>
            <span>
              <el-button size="mini" type="text" on-click={() => this.append(data)}> 添加</el-button>
              <el-button size="mini" type="text" on-click={() => this.remove(node, data)}> 删除</el-button>
            </span>
          </span>);
      } else {
        return (
          <span class="custom-tree-node">
            <span>{node.label}</span>
            <span>
              <el-button size="mini" type="text" on-click={() => this.remove(node, data)}> 删除</el-button>
            </span>
          </span>);
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        userId: null,
        name: null,
        categoryId: null,
        price: null,
        image: null,
        description: null,
        status: null,
        createTime: null,
        updateTime: null,
        createUser: null,
        updateUser: null,
        flavors: {}
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加菜品";
      this.data = this.addFlavors;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDish(id).then(response => {
        this.form = response.data;
        this.form.flavors = {}
        this.open = true;
        this.title = "修改菜品";
      });
      getDishFlavors(id).then(responce => {
        const rd = responce.data

        this.data = []

        rd.forEach(element => {
          this.data.push({
            id: element.id, // 生成唯一的 id，可以根据具体需求调整生成规则
            label: element.name,
            children: JSON.parse(element.value).map((value, idx) => ({
              id: element.id * 10 + (idx + 1), // 生成子项的 id，可以根据具体需求调整生成规则
              label: value
            }))
          })
        })

        // try {
        //   const flavorItem = rd.forEach((item, index) => ({
        //     id: item.id, // 生成唯一的 id，可以根据具体需求调整生成规则
        //     label: item.name,
        //     // children: JSON.parse(item.value).map((value, idx) => ({
        //     //   id: index * 10 + (idx + 1), // 生成子项的 id，可以根据具体需求调整生成规则
        //     //   label: value
        //     // }))
        //   }));
        //   this.data = flavorItem
        //   console.log(flavorItem)
        // } catch (error) {
        //   console.log(error);
        //   this.data = this.addFlavors
        // }
      })
      // console.log(this.form.flavors)
    },
    /** 提交按钮 */
    submitForm() {
      this.data.forEach(element => {
        // 把elment整理为KeyValue结构 如果value为空则不添加
        if (element.children.length != 0) {
          var values = "["
          // this.form.flavors[element.label] = '['
          element.children.forEach(child => {
            // 使用双引号括起来
            values += `"${child.label}",`
          });
          //去除末尾, 拼接上]
          values = values.substring(0, values.length - 1) + ']'
          //添加到flavors中
          // console.log(values)
          this.form.flavors[element.label] = values;
        }
      });
      console.log(this.form.flavors)
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDish(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDish(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除菜品编号为"' + ids + '"的数据项？').then(function () {
        return delDish(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/dish/export', {
        ...this.queryParams
      }, `dish_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>