// pages/merchant/index.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        stores:[]
    },
    onShow() {
    },
    onLoad() {
        // Fetch data from the API
        wx.request({
            url: 'http://localhost:8080/user/merchant/list',
            method: 'GET',
            success: (res) => {
                const data = res.data.data
                // console.log(data)
                this.setData({
                    stores:data
                });
            },
            fail: (err) => {
                console.error('Failed to fetch stores:', err);
            }
        });

    },
    navigateToStore: function (event) {
        console.log(event.currentTarget.dataset);
        const dataset = event.currentTarget.dataset.item;
        getApp().globalData.storeInfo = dataset;
        wx.navigateTo({
            url: '/pages/index/index?id=' + dataset.userId
        });
    },
    methods: {
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady() {

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload() {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom() {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage() {

    }
})