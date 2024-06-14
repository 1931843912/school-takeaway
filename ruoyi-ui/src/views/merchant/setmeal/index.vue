<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="套餐名称" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入套餐名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="售卖状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择售卖状态" clearable>
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
          v-hasPermi="['system:setmeal:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['system:setmeal:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['system:setmeal:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['system:setmeal:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="setmealList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键" align="center" prop="id" /> -->
      <el-table-column label="菜品分类id" align="center" prop="categoryId" />
      <el-table-column label="套餐名称" align="center" prop="name" />
      <el-table-column label="套餐价格" align="center" prop="price" />
      <el-table-column label="售卖状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status" />
        </template>
      </el-table-column>
      <!-- <el-table-column label="状态" align="center" width="100">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.status"
            active-value="0"
            inactive-value="1"
            @change="handleStatusChange(scope.row)"
          ></el-switch>
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="描述信息" align="center" prop="description" /> -->
      <el-table-column label="图片" align="center" prop="image" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50" />
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
            v-hasPermi="['system:setmeal:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['system:setmeal:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改套餐对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="套餐分类" prop="categoryId">
          <!-- 使用下拉框形式 -->
          <el-select v-model="form.categoryId" placeholder="请选择套餐分类">
            <el-option v-for="dict in categoryList" :key="dict.id" :label="dict.name" :value="dict.id"></el-option>
          </el-select>
        </el-form-item>
        <!-- 多选框选中数据 -->
          <el-form-item label="套餐项目" prop="dishItems">
          <el-select v-model="form.dishItems" multiple placeholder="请选择套餐项目">
            <el-option v-for="dict in dishList" :key="dict.id" :label="dict.name" :value="dict.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="套餐名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入套餐名称" />
        </el-form-item>
        <el-form-item label="套餐价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入套餐价格" />
        </el-form-item>
        <el-form-item label="售卖状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in dict.type.sys_normal_disable" :key="dict.value" :label="parseInt(dict.value)">{{
              dict.label }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="描述信息">
          <editor v-model="form.description" :min-height="192" />
        </el-form-item>
        <el-form-item label="图片" prop="image">
          <image-upload v-model="form.image" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSetmeal, getSetmeal, delSetmeal, addSetmeal, updateSetmeal,ListDish } from "@/api/merchant/setmeal/index";
import { listCategory } from '@/api/merchant/category/index'
export default {
  name: "Setmeal",
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
      // 套餐表格数据
      setmealList: [],
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
      //菜品列表
      dishList: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        categoryId: [
          { required: true, message: "菜品分类id不能为空", trigger: "change" }
        ],
        name: [
          { required: true, message: "套餐名称不能为空", trigger: "blur" }
        ],
        price: [
          { required: true, message: "套餐价格不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "售卖状态不能为空", trigger: "change" }
        ],
        description: [
          { required: true, message: "描述信息不能为空", trigger: "blur" }
        ],
        image: [
          { required: true, message: "图片不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getCategoryList();
    this.getDishList();
  },
  methods: {
    /** 查询套餐列表 */
    getList() {
      this.loading = true;
      listSetmeal(this.queryParams).then(response => {
        this.setmealList = response.rows;
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
    // 查询菜品列表
    getDishList(){
      this.loading = true;
      ListDish(this.queryParams).then(response => {
        this.dishList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 套餐状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "起售" : "停售";
      this.$modal.confirm('确认要"' + text + '""' + row.name + '"套餐吗？').then(function() {
        return changeSetmealStatus(row.id,row.status);
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
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
        categoryId: null,
        name: null,
        price: null,
        status: null,
        description: null,
        image: null,
        createTime: null,
        updateTime: null,
        createUser: null,
        updateUser: null,
        dishItems:null
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
      this.title = "添加套餐";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSetmeal(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改套餐";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSetmeal(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSetmeal(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除套餐编号为"' + ids + '"的数据项？').then(function () {
        return delSetmeal(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/setmeal/export', {
        ...this.queryParams
      }, `setmeal_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>