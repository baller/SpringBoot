<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="6" v-for="item in cards" :key="item.title">
        <el-card class="box-card">
          <div slot="header" class="clearfix">{{ item.title }}</div>
          <div class="text item">
            <svg class="icon" aria-hidden="true">
              <use :xlink:href="item.icon" style="width: 100px"></use>
            </svg>
            <span class="text">{{ item.data }}</span>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <div id="myTimer" style="margin-left: 15px;font-weight: 550;"></div>
    <div style="display: flex;">
        <!-- #main -->
        <div id="main" style="width: 30%; height: 480px;"></div>
        
        <!-- #pieChart -->
        <div id="pieChart" style="width: 70%; height: 480px;"></div>
      </div>
      
  </div>
</template>

<script>
import * as echarts from 'echarts'
import {ElMessage} from "element-plus";
import request from "../utils/request";

export default {
  data() {
    return {
      cards: [
        { title: '已借阅', data: 100, icon: '#iconlend-record-pro' },
        { title: '总访问', data: 100, icon: '#iconvisit'   },
        { title: '图书数', data: 100, icon: '#iconbook-pro' },
        { title: '用户数', data: 1000, icon: '#iconpopulation' }
      ],
      data:{},
      bookList:{}
    }
  },
  created() {
    
  },
  mounted() {
    
    this.circleTimer()
    //统计面板
    request.get("/dashboard").then(res=>{
      if(res.code == 0)
      {

        this.cards[0].data = res.data.lendRecordCount
        this.cards[1].data = res.data.visitCount
        this.cards[2].data = res.data.bookCount
        this.cards[3].data = res.data.userCount

      }
      else
      {
        ElMessage.error(res.msg)
      }


      // 基于准备好的dom，初始化echarts实例
      var myChart = echarts.init(document.getElementById('main'))
    console.log(this.cards[0].data)
      // 绘制图表
      myChart.setOption({
        title: {
          text: '统计'
        },
        tooltip: {
          trigger: 'axis'
          // axisPointer: {
          //   type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          // }
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: this.cards.map(item => item.title),
          axisTick: {
            alignWithLabel: true
          }
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            type: 'bar',
            label: { show: true },
            barWidth: '25%',
            data: [
              {
                value: this.cards[0].data,
                itemStyle: { color: '#5470c6' }
              },
              {
                value: this.cards[1].data,
                itemStyle: { color: '#91cc75' }
              },
              {
                value: this.cards[2].data,
                itemStyle: { color: '#fac858' }
              },
              {
                value: this.cards[3].data,
                itemStyle: { color: '#ee6666' }
              }
            ]
          }
        ]
      })
      window.addEventListener('resize', () => {
        myChart.resize()
      })
    })
    //饼图面板
    request.get("http://localhost:9876/api/book?pageNum=1&pageSize=9999&search1=&search2=&search3=").then(res => {
    
      // 初始化饼状图实例
        var pieChart = echarts.init(document.getElementById('pieChart'));
        this.bookList=res.data.records
        
         // 绘制饼状图
      // Calculate book genre counts
        const genreCounts = {};
        for (const book of this.bookList) {
        if (genreCounts[book.genre]) {
            genreCounts[book.genre]++;
        } else {
            genreCounts[book.genre] = 1;
        }
        }

        // Prepare data for the pie chart
        const pieChartData = Object.entries(genreCounts).map(([genre, count]) => ({
        name: genre,
        value: count
        }));

        // 绘制饼状图
        pieChart.setOption({
        title: {
            text: '图书分类统计',
            left: 'center',
            top: 20
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c}本 ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'top',
            data: Object.keys(genreCounts)
        },
        series: [
            {
            name: '类型',
            type: 'pie',
            radius: '75%',
            center: ['50%', '60%'],
            data: pieChartData,
            emphasis: {
                itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
            }
        ]
        });

        window.addEventListener('resize', () => {
            pieChart.resize();
        });
        });
  },
  methods: {
    
    circleTimer() {
      this.getTimer()
      setInterval(() => {
        this.getTimer()
      }, 1000)
    },
    getTimer() {
      var d = new Date()
      var t = d.toLocaleString()
      document.getElementById('myTimer').innerHTML = t
    },
    fetchBookList() {
      const apiUrl = "http://localhost:9876/api/book?pageNum=1&pageSize=99999&search1=&search2=&search3=";

      request.get(apiUrl).then((res) => {
        if (res.code === "0") {
          this.bookList = res.data.records;
          console.log(this.bookList)
        } else {
          ElMessage.error(res.msg);
        }
      });
    }
  }
}
</script>

<style scoped>
.box-card {
   width: 80%;
  margin-bottom: 25px;
  margin-left: 10px;
}

.clearfix {
  text-align: center;
  font-size: 15px;
}

.text {
  text-align: center;
  font-size: 24px;
  font-weight: 700;
  vertical-align: super;
}

#main {
  width: 100%;
  height: 450px;
  margin-top: 20px;
}

.icon {
  width: 50px;
  height: 50px;
  padding-top: 5px;
  padding-right: 10px;
}
</style>