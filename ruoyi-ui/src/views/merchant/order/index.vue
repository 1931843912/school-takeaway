<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="number">
        <el-input v-model="queryParams.number" placeholder="请输入订单号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="下单用户" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入下单用户" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="地址id" prop="addressBookId">
        <el-input v-model="queryParams.addressBookId" placeholder="请输入地址id" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="下单时间" prop="orderTime">
        <el-date-picker clearable v-model="queryParams.orderTime" type="date" value-format="yyyy-MM-dd"
          placeholder="请选择下单时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结账时间" prop="checkoutTime">
        <el-date-picker clearable v-model="queryParams.checkoutTime" type="date" value-format="yyyy-MM-dd"
          placeholder="请选择结账时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="支付方式 1微信,2支付宝" prop="payMethod">
        <el-input v-model="queryParams.payMethod" placeholder="请输入支付方式 1微信,2支付宝" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="实收金额" prop="amount">
        <el-input v-model="queryParams.amount" placeholder="请输入实收金额" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input v-model="queryParams.phone" placeholder="请输入手机号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="地址" prop="address">
        <el-input v-model="queryParams.address" placeholder="请输入地址" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="用户名称" prop="userName">
        <el-input v-model="queryParams.userName" placeholder="请输入用户名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="收货人" prop="consignee">
        <el-input v-model="queryParams.consignee" placeholder="请输入收货人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="订单取消原因" prop="cancelReason">
        <el-input v-model="queryParams.cancelReason" placeholder="请输入订单取消原因" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="订单拒绝原因" prop="rejectionReason">
        <el-input v-model="queryParams.rejectionReason" placeholder="请输入订单拒绝原因" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="订单取消时间" prop="cancelTime">
        <el-date-picker clearable v-model="queryParams.cancelTime" type="date" value-format="yyyy-MM-dd"
          placeholder="请选择订单取消时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="预计送达时间" prop="estimatedDeliveryTime">
        <el-date-picker clearable v-model="queryParams.estimatedDeliveryTime" type="date" value-format="yyyy-MM-dd"
          placeholder="请选择预计送达时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="送达时间" prop="deliveryTime">
        <el-date-picker clearable v-model="queryParams.deliveryTime" type="date" value-format="yyyy-MM-dd"
          placeholder="请选择送达时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="打包费" prop="packAmount">
        <el-input v-model="queryParams.packAmount" placeholder="请输入打包费" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="餐具数量" prop="tablewareNumber">
        <el-input v-model="queryParams.tablewareNumber" placeholder="请输入餐具数量" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!-- <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['system:orders:add']">新增</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleCancel"
          v-hasPermi="['admin:orders:cancel']">取消订单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleReject"
          v-hasPermi="['admin:orders:rejection']">拒单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleConfirm"
          v-hasPermi="['admin:orders:confirm']">接单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleDelivery"
          v-hasPermi="['admin:orders:delivery']">派单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleComplete"
          v-hasPermi="['admin:orders:complete']">完成订单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['system:orders:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['system:orders:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ordersList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="订单号" align="center" prop="number" />
      <el-table-column label="订单状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.order_status" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="下单用户" align="center" prop="userId" />
      <el-table-column label="地址id" align="center" prop="addressBookId" />
      <el-table-column label="下单时间" align="center" prop="orderTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结账时间" align="center" prop="checkoutTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.checkoutTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="支付方式" align="center" prop="payMethod">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.payment_method" :value="scope.row.payMethod" />
        </template>
      </el-table-column>
      <el-table-column label="支付状态" align="center" prop="payStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.order_payment_status" :value="scope.row.payStatus" />
        </template>
      </el-table-column>
      <el-table-column label="实收金额" align="center" prop="amount" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="手机号" align="center" prop="phone" />
      <el-table-column label="地址" align="center" prop="address" />
      <el-table-column label="用户名称" align="center" prop="userName" />
      <el-table-column label="收货人" align="center" prop="consignee" />
      <el-table-column label="订单取消原因" align="center" prop="cancelReason" />
      <el-table-column label="订单拒绝原因" align="center" prop="rejectionReason" />
      <el-table-column label="订单取消时间" align="center" prop="cancelTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.cancelTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预计送达时间" align="center" prop="estimatedDeliveryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.estimatedDeliveryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="配送状态" align="center" prop="deliveryStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sent_status" :value="scope.row.deliveryStatus" />
        </template>
      </el-table-column>
      <el-table-column label="送达时间" align="center" prop="deliveryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deliveryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="打包费" align="center" prop="packAmount" />
      <el-table-column label="餐具数量" align="center" prop="tablewareNumber" />
      <el-table-column label="餐具数量状态  1按餐量提供  0选择具体数量" align="center" prop="tablewareStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['system:orders:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['system:orders:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单号" prop="number">
          <el-input v-model="form.number" placeholder="请输入订单号" />
        </el-form-item>
        <el-form-item label="下单用户" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入下单用户" />
        </el-form-item>
        <el-form-item label="地址id" prop="addressBookId">
          <el-input v-model="form.addressBookId" placeholder="请输入地址id" />
        </el-form-item>
        <el-form-item label="下单时间" prop="orderTime">
          <el-date-picker clearable v-model="form.orderTime" type="date" value-format="yyyy-MM-dd"
            placeholder="请选择下单时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="结账时间" prop="checkoutTime">
          <el-date-picker clearable v-model="form.checkoutTime" type="date" value-format="yyyy-MM-dd"
            placeholder="请选择结账时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="支付方式 1微信,2支付宝" prop="payMethod">
          <el-input v-model="form.payMethod" placeholder="请输入支付方式 1微信,2支付宝" />
        </el-form-item>
        <el-form-item label="实收金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入实收金额" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入地址" />
        </el-form-item>
        <el-form-item label="用户名称" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入用户名称" />
        </el-form-item>
        <el-form-item label="收货人" prop="consignee">
          <el-input v-model="form.consignee" placeholder="请输入收货人" />
        </el-form-item>
        <el-form-item label="订单取消原因" prop="cancelReason">
          <el-input v-model="form.cancelReason" placeholder="请输入订单取消原因" />
        </el-form-item>
        <el-form-item label="订单拒绝原因" prop="rejectionReason">
          <el-input v-model="form.rejectionReason" placeholder="请输入订单拒绝原因" />
        </el-form-item>
        <el-form-item label="订单取消时间" prop="cancelTime">
          <el-date-picker clearable v-model="form.cancelTime" type="date" value-format="yyyy-MM-dd"
            placeholder="请选择订单取消时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预计送达时间" prop="estimatedDeliveryTime">
          <el-date-picker clearable v-model="form.estimatedDeliveryTime" type="date" value-format="yyyy-MM-dd"
            placeholder="请选择预计送达时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="送达时间" prop="deliveryTime">
          <el-date-picker clearable v-model="form.deliveryTime" type="date" value-format="yyyy-MM-dd"
            placeholder="请选择送达时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="打包费" prop="packAmount">
          <el-input v-model="form.packAmount" placeholder="请输入打包费" />
        </el-form-item>
        <el-form-item label="餐具数量" prop="tablewareNumber">
          <el-input v-model="form.tablewareNumber" placeholder="请输入餐具数量" />
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
import { listOrders, getOrders, delOrders, addOrders, updateOrders, takingOrdersById, deliveryOrdersById, completeOrdersById, cancelOrdersById, rejectOrdersById } from "@/api/merchant/orders/index";

export default {
  name: "Orders",
  dicts: ['payment_method', 'order_payment_status', 'sent_status', 'order_status'],
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
      // 订单表格数据
      ordersList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        number: null,
        status: null,
        userId: null,
        addressBookId: null,
        orderTime: null,
        checkoutTime: null,
        payMethod: null,
        payStatus: null,
        amount: null,
        phone: null,
        address: null,
        userName: null,
        consignee: null,
        cancelReason: null,
        rejectionReason: null,
        cancelTime: null,
        estimatedDeliveryTime: null,
        deliveryStatus: null,
        deliveryTime: null,
        packAmount: null,
        tablewareNumber: null,
        tablewareStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        status: [
          { required: true, message: "订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款不能为空", trigger: "change" }
        ],
        userId: [
          { required: true, message: "下单用户不能为空", trigger: "blur" }
        ],
        addressBookId: [
          { required: true, message: "地址id不能为空", trigger: "blur" }
        ],
        // orderTime: [
        //   { required: true, message: "下单时间不能为空", trigger: "blur" }
        // ],
        // payMethod: [
        //   { required: true, message: "支付方式 1微信,2支付宝不能为空", trigger: "blur" }
        // ],
        // payStatus: [
        //   { required: true, message: "支付状态 0未支付 1已支付 2退款不能为空", trigger: "change" }
        // ],
        // amount: [
        //   { required: true, message: "实收金额不能为空", trigger: "blur" }
        // ],
        // deliveryStatus: [
        //   { required: true, message: "配送状态  1立即送出  0选择具体时间不能为空", trigger: "change" }
        // ],
        // tablewareStatus: [
        //   { required: true, message: "餐具数量状态  1按餐量提供  0选择具体数量不能为空", trigger: "change" }
        // ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询订单列表 */
    getList() {
      this.loading = true;
      listOrders(this.queryParams).then(response => {
        this.ordersList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        number: null,
        status: null,
        userId: null,
        addressBookId: null,
        orderTime: null,
        checkoutTime: null,
        payMethod: null,
        payStatus: null,
        amount: null,
        remark: null,
        phone: null,
        address: null,
        userName: null,
        consignee: null,
        cancelReason: null,
        rejectionReason: null,
        cancelTime: null,
        estimatedDeliveryTime: null,
        deliveryStatus: null,
        deliveryTime: null,
        packAmount: null,
        tablewareNumber: null,
        tablewareStatus: null
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
      this.title = "添加订单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrders(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单";
      });
    },
    // 取消订单
    handleCancel(row) {
      this.reset();
      const id = row.id || this.ids
      this.$modal.confirm('是否确认取消订单编号为"' + id + '"的数据项？').then(function () {
        return cancelOrdersById(id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("取消成功");
      }).catch(() => { });
    },

    // 拒绝订单
    handleReject(row) {
      this.reset();
      const id = row.id || this.ids
      this.$modal.confirm('是否确认拒绝订单编号为"' + id + '"的数据项？').then(function () {
        return rejectOrdersById(id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("拒绝成功");
      }).catch(() => { });
    },
    //接单
    handleConfirm(row){
      this.reset();
      const id = row.id || this.ids
      this.$modal.confirm('是否确认接单订单编号为"' + id + '"的数据项？').then(function () {
        return confirmOrdersById(id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("接单成功");
      }).catch(() => { });
    },

    //派送订单
    handleDelivery(row) {
      this.reset();
      const id = row.id || this.ids
      this.$modal.confirm('是否确认配送订单编号为"' + id + '"的数据项？').then(function () {
        return deliveryOrdersById(id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("配送成功");
      }).catch(() => { });
    },
    //完成订单
    handleComplete(row) {
      this.reset();
      const id = row.id || this.ids
      this.$modal.confirm('是否确认完成订单编号为"' + id + '"的数据项？').then(function () {
        return completeOrdersById(id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("完成成功");
      }).catch(() => { });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateOrders(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrders(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除订单编号为"' + ids + '"的数据项？').then(function () {
        return delOrders(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/orders/export', {
        ...this.queryParams
      }, `orders_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
