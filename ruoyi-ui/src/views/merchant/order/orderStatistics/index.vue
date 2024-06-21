<template>
  <div class="app-container">
    <!-- v-loading="loading" -->
    <!-- <el-table >
      <div ref="myChart" id="myChart"></div>
    </el-table> -->
    <div ref="myChart" id="myChart" style="width: 80%; height: 400px; margin-left: 10%;"></div>
    <h4 style="margin-left: 47%;">总订单数：{{ total }}</h4>
  </div>
</template>

<script>
import { getOrdersCount , completeOrdersById , deliveryOrdersById , takingOrdersById , cancelOrdersById  , rejectOrdersById} from "@/api/merchant/orders/index";
import * as echarts from 'echarts';

export default {
  name: "orderStatistics",
  data() {
    return {
      total: 0,
      // 遮罩层
      loading: true,

      option: {
        title: {
          text: '外卖订单统计',
          subtext: '各个状态的订单数量统计',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          orient: 'vertical',
          left: 'left'
        },
        series: [
          {
            name: 'Access From',                                                                     
            type: 'pie',
            radius: '50%',
            data: [
              { value: 1048, name: 'Search Engine' },
              { value: 735, name: 'Direct' },
              { value: 580, name: 'Email' },
              { value: 484, name: 'Union Ads' },
              { value: 300, name: 'Video Ads' }
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      }
    }

  },
  mounted() {
    

    const data = {
      id: 1,
      rejectionReason: '太远了'
    }
    rejectOrdersById(data)
    .then(res => {
          // 这里可以对结果进行处理，比如更新表格数据
          console.log("Result of rejectOrdersById:", res.data);
        })
        .catch(err => {
          console.error("Error while rejectOrdersById:", err);
        });;

    // const data = {
    //   id: 1,
    //   cancelReason: '不要了'
    // }
    // cancelOrdersById(data)
    // .then(res => {
    //       // 这里可以对结果进行处理，比如更新表格数据
    //       console.log("Result of cancelOrdersById:", res.data);
    //     })
    //     .catch(err => {
    //       console.error("Error while cancelOrdersById:", err);
    //     });;

    // takingOrdersById(1)
    // .then(res => {
    //       // 这里可以对结果进行处理，比如更新表格数据
    //       console.log("Result of takingOrdersById:", res.data);
    //     })
    //     .catch(err => {
    //       console.error("Error while takingOrdersById:", err);
    //     });;
    

    // deliveryOrdersById(1)
    // .then(res => {
    //       // 这里可以对结果进行处理，比如更新表格数据
    //       console.log("Result of deliveryOrdersById:", res.data);
    //     })
    //     .catch(err => {
    //       console.error("Error while deliveryOrdersById:", err);
    //     });;

    // completeOrdersById(1)
    // .then(res => {
    //       // 这里可以对结果进行处理，比如更新表格数据
    //       console.log("Result of completeOrdersById:", res.data);
    //     })
    //     .catch(err => {
    //       console.error("Error while completeOrdersById:", err);
    //     });;

    this.getOrdersCount();
    // 初始化表格
    const dom = document.getElementById("myChart");

    if (dom) { // 确保 DOM 元素存在  
      const myChart = echarts.init(dom);
      myChart.setOption(this.option);
    }
  },
  methods: {

    getOrdersCount() {
      this.loading = true
      getOrdersCount()
        .then(res => {
          // 这里可以对结果进行处理，比如更新表格数据
          console.log("Result of getOrdersCount:", res.data);
          this.total = res.data.allOrders;
          const orderData = [
            // { value: res.data.allOrders, name: '所有订单' },
            { value: res.data.cancelledOrders, name: '已取消' },
            { value: res.data.completedOrders, name: '已完成' },
            { value: res.data.deliveredOrders, name: '待派送' },
            { value: res.data.deliveryIngOrders, name: '派送中' },
            { value: res.data.waitingOrders, name: '待接单' }
          ];

          // 更新图表的 option.series[0].data  
          this.option.series[0].data = orderData;

          // 如果图表已经初始化，您可能需要重新渲染图表  
          const dom = document.getElementById("myChart");

          if (dom) { // 确保 DOM 元素存在  
            const myChart = echarts.init(dom);
            myChart.setOption(this.option);
          }

          this.loading = false


        })
        .catch(err => {
          console.error("Error while getOrdersCount:", err);
        });


    }
  }
};
</script>