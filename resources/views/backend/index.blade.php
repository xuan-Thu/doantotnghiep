@extends('backend.layouts.master')
@section('title','DASHBOARD')
@section('main-content')
<div class="container-fluid">
  @include('backend.layouts.notification')
  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
  </div>
  <!-- Content Row -->
  <div class="row">
    <!-- Category -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Category</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Category::countActiveCategory()}}</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-sitemap fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Products -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Products Total</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Product::countActiveProduct()}}</div>
            </div>
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Product is out of stock( <=5 )</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Product::countStockProduct()}}</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-cubes fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Order -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Order Total</div>
              <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">{{\App\Models\Order::countActiveOrder()}}</div>
            </div>
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Order is waiting for Process</div>
              <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">{{\App\Models\Order::countStatusOrder()}}</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--Posts-->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Post</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Post::countActivePost()}}</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-folder fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Dashboard -->
  <div class="row">
    <!-- line Chart -- Earnings Overview -->
    <div class="col-xl-8 col-lg-7">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
        </div>
        <!-- Card Body -->
        <div class="card-body" style="height: 550px">
          <div class="chart-area">
            <canvas id="myAreaChart"></canvas>
          </div>
        </div>
      </div>
    </div>
    <!-- Pie user Chart -->
    <div class="col-xl-4 col-lg-5">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Users</h6>
        </div>
        <!-- Card Body -->
        <div class="card-body" style="overflow:hidden">
          <div id="pie_chart" style="width:350px; height:320px;">
        </div>
      </div>
    </div>
  </div>
  <div class="col-xl-8 col-lg-7"><!-- bar Chart -- Earnings year Overview -->
    <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
      </div>
      <!-- Card Body -->
      <div class="card-body" style="height: 550px">
        <div class="chart-area">
          <canvas id="myAreaChart1"></canvas>
        </div>
      </div>
    </div>
  </div>
  <!-- bar Chart -- month -->
  {{-- <div class="col-xl-12 col-lg-7" style="height: 800px">
    <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">Earnings Month</h6>
      </div>
      <!-- Card Body -->
      <div class="chartCard"
      style="width: 100%;
      height: 700px;
      display: flex;
      align-items: center;
      justify-content: center;">
        <div class="chartBox"
        style="width: 80%;
        Height: 90%;
        border-radius: 20px;
        border: solid 3px rgb(35, 209, 137);
        background: white;">
          <canvas id="barChart"></canvas>
        </div>
      </div>
    </div>
  </div> --}}
  <!-- pie Chart -- month -->
  {{-- <div class="col-xl-6 col-lg-6">
    <div class="card shadow mb-4"> <!-- Last Month-->
      <!-- Card Header - Dropdown -->
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">Earnings Last Month</h6>
        <div>
          <input type="checkbox" name="colorCheckbox" value="month5"> Month 5
          <input type="checkbox" name="colorCheckbox" value="month6"> Month 6
          <input type="checkbox" name="colorCheckbox" value="month7"> Month 7
        </div>
      </div>
      <!-- Card Body -->
      <div class="month5 select" style="width: 100%; height: 450px; display: none; align-items: center; justify-content: center;">
        <div class="chartBox" style="width: 95%; height: 95%; border-radius: 20px; border: solid 3px rgb(48, 25, 180); background: white;">
          <canvas id="pieChart1"></canvas>
        </div>
      </div>
      <div class="month6 select" class="chartCard" style="width: 100%; height: 450px; display: none; align-items: center; justify-content: center;">
        <div class="chartBox" style="width: 95%; height: 95%; border-radius: 20px; border: solid 3px rgb(48, 25, 180); background: white;">
          <canvas id="pieChart2"></canvas>
        </div>
      </div>
      <div class="month7 select" class="chartCard" style="width: 100%; height: 450px; display: none; align-items: center; justify-content: center;">
        <div class="chartBox" style="width: 95%; height: 95%; border-radius: 20px; border: solid 3px rgb(48, 25, 180); background: white;">
          <canvas id="pieChart3"></canvas>
        </div>
      </div>
    </div>
  </div> --}}
  {{-- <div class="col-xl-6 col-lg-6"><!-- This Month-->
    <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">Earnings This Month</h6>
      </div>
      <!-- Card Body -->
      <div class="chartCard"
        style="width: 100%;
        height: 450px;
        display: flex;
        align-items: center;
        justify-content: center;">
          <div class="chartBox"
          style="width: 95%;
          height: 95%;
          border-radius: 20px;
          border: solid 3px rgb(48, 25, 180);
          background: white;">
            <canvas id="pieChart2"></canvas>
          </div>
        </div>
    </div>
  </div> --}}
  <!-- line Chart -->
  {{-- <div class="col-xl-8 col-lg-7">
    <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">Earnings line</h6>
      </div>
      <!-- Card Body -->
      <div class="chartCard"
      style="width: 100%;
      height: 450px;
      display: flex;
      align-items: center;
      justify-content: center;">
        <div class="chartBox"
        style="width: 80%;
        border-radius: 20px;
        border: solid 3px rgba(255, 26, 104, 1);
        background: white;">
          <canvas id="lineChart"></canvas>
        </div>
      </div>
    </div>
  </div> --}}
  <!-- Content Row -->
</div>
@endsection

@push('scripts')
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
{{-- pie chart --}}
<script type="text/javascript">
  var analytics = <?php echo $users; ?>

  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart()
  {
      var data = google.visualization.arrayToDataTable(analytics);
      var options = {
          title : 'Last 7 Days registered user'
      };
      var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));
      chart.draw(data, options);
  }
</script>
  {{-- line chart --}}
  <script type="text/javascript">{{-- myLineChart1 --}}
    const url = "{{route('product.order.income1')}}";
    function number_format(number, decimals, dec_point, thousands_sep) {
      // *     example: number_format(1234.56, 2, ',', ' ');
      // *     return: '1 234,56'
      number = (number + '').replace(',', '').replace(' ', '');
      var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function(n, prec) {
          var k = Math.pow(10, prec);
          return '' + Math.round(n * k) / k;
        };
      // Fix for IE parseFloat(0.55).toFixed(0) = 0;
      s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
      if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }
      if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
      }
      return s.join(dec);
    }
    // Area Chart Example
    var ctx = document.getElementById("myAreaChart");
      axios.get(url)
        .then(function (response) {
          const data_keys = Object.keys(response.data);
          const data_values = Object.values(response.data);
          var myLineChart = new Chart(ctx, {
            type: 'line',
            data: {
              labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],// data_keys,["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
              datasets: [{
                label: "Earnings",
                lineTension: 0.3,
                backgroundColor: "rgba(78, 115, 223, 0.05)",
                borderColor: "rgba(78, 115, 223, 1)",
                pointRadius: 3,
                pointBackgroundColor: "rgba(78, 115, 223, 1)",
                pointBorderColor: "rgba(78, 115, 223, 1)",
                pointHoverRadius: 3,
                pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                pointHitRadius: 10,
                pointBorderWidth: 2,
                data:data_values,// [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
              }],
            },
          });
        })
        .catch(function (error) {
        //   vm.answer = 'Error! Could not reach the API. ' + error
        console.log(error)
        });
  </script>
  <script type="text/javascript">{{-- myBarChart2 --}}
    const url1 = "{{route('product.order.income')}}";
    function number_format(number, decimals, dec_point, thousands_sep) {
      // *     example: number_format(1234.56, 2, ',', ' ');
      // *     return: '1 234,56'
      number = (number + '').replace(',', '').replace(' ', '');
      var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function(n, prec) {
          var k = Math.pow(10, prec);
          return '' + Math.round(n * k) / k;
        };
      // Fix for IE parseFloat(0.55).toFixed(0) = 0;
      s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
      if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }
      if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
      }
      return s.join(dec);
    }
    // Area Chart Example
    var ctx1 = document.getElementById("myAreaChart1");
      axios.get(url1)
        .then(function (response) {
          const data_keys1 = Object.keys(response.data);
          const data_values1 = Object.values(response.data);
          var myBarChart = new Chart(ctx1, {
            type: 'bar',
            data: {
              labels: data_keys1,//['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'], ,["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
              datasets: [{
                label: "Earnings",
                lineTension: 0.3,
                backgroundColor: [
                  'rgb(27, 38, 71)',
                  'rgb(219, 137, 21)',
                  'rgb(63, 81, 23)',
                  'rgb(237, 248, 252)',
                  'rgb(23, 36, 76)',
                  'rgb(73, 40, 4)',
                  'rgb(28, 40, 21)',
                  'rgb(141, 239, 169)',
                  'rgb(181, 52, 144)',
                  'rgb(168, 117, 21)',
                  'rgb(79, 61, 70)',
                  'rgb(11, 117, 124)',
                ],
                borderColor: [
                  'rgb(27, 38, 71)',
                  'rgb(219, 137, 21)',
                  'rgb(63, 81, 23)',
                  'rgb(237, 248, 252)',
                  'rgb(23, 36, 76)',
                  'rgb(73, 40, 4)',
                  'rgb(28, 40, 21)',
                  'rgb(141, 239, 169)',
                  'rgb(181, 52, 144)',
                  'rgb(168, 117, 21)',
                  'rgb(79, 61, 70)',
                  'rgb(11, 117, 124)',
                ],
                data:data_values1,// [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
              }],
            },
          });
        })
        .catch(function (error) {
        //   vm.answer = 'Error! Could not reach the API. ' + error
        console.log(error)
        });
  </script>
  <script>{{-- barchart --}}
    const databar = {
      labels: ['1','2','3','4','5','6','7','8','9','10','11','12'],
      datasets: [{
        label: 'Earnings',
        data: ['0','0','0','0','0','0','7','8','0','0','0','0'],
        backgroundColor: [
          'rgb(56, 79, 71)',
          'rgb(135, 132, 206)',
          'rgb(230, 237, 218)',
          'rgb(19, 33, 24)',
          'rgb(163, 198, 185)',
          'rgb(132, 202, 216)',
          'rgb(93, 28, 109)',
          'rgb(232, 150, 221)',
          'rgb(75, 163, 98)',
          'rgb(107, 92, 99)',
          'rgb(30, 40, 35)',
          'rgb(93, 21, 119)',
        ],
        borderColor: [
          'rgb(56, 79, 71)',
          'rgb(135, 132, 206)',
          'rgb(230, 237, 218)',
          'rgb(19, 33, 24)',
          'rgb(163, 198, 185)',
          'rgb(132, 202, 216)',
          'rgb(93, 28, 109)',
          'rgb(232, 150, 221)',
          'rgb(75, 163, 98)',
          'rgb(107, 92, 99)',
          'rgb(30, 40, 35)',
          'rgb(93, 21, 119)',
        ],
        borderWidth: 1
      }]
    };

    // config 
    const configbar = {
      type: 'bar',
      data: databar,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    const barChart = new Chart(
      document.getElementById('barChart'),
      configbar
    );
  </script>
  <script>{{-- piechart1 --}}
    const datapie1 = {
      labels: ["New", "Proccess", "Delevery", "Cancel"],
      datasets: [{
        label: 'Earnings',
        data: [0],
        backgroundColor: [
          'rgb(105, 175, 167)',
          'rgb(244, 161, 204)',
          'rgb(227, 244, 210)',
          'rgb(10, 107, 105)',
        ],
        borderColor: [
          'rgb(105, 175, 167)',
          'rgb(244, 161, 204)',
          'rgb(227, 244, 210)',
          'rgb(10, 107, 105)',
        ],
        borderWidth: 1
      }]
    };

    // config 
    const configpie1 = {
      type: 'pie',
      data: datapie1,
      options: {}
    };

    const pieChart1 = new Chart(
      document.getElementById('pieChart1'),
      configpie1
    );
  </script>
  <script>{{-- piechart2 --}}
    const datapie2 = {
      labels: ["New", "Proccess", "Delevery", "Cancel"],
      datasets: [{
        label: 'Earnings',
        data: [0, 0, 0, 0],
        backgroundColor: [
          'rgb(28, 253, 133)',
          'rgb(60, 73, 222)',
          'rgb(90, 57, 113)',
          'rgb(154, 111, 175)',
        ],
        borderColor: [
          'rgb(28, 253, 133)',
          'rgb(60, 73, 222)',
          'rgb(90, 57, 113)',
          'rgb(154, 111, 175)',
        ],
        borderWidth: 1
      }]
    };

    // config 
    const configpie2 = {
      type: 'pie',
      data: datapie2,
      options: {}
    };

    const pieChart2 = new Chart(
      document.getElementById('pieChart2'),
      configpie2
    );
  </script>
  <script>{{-- piechart3 --}}
    const datapie3 = {
      labels: ["New", "Proccess", "Delevery", "Cancel"],
      datasets: [{
        label: 'Earnings',
        data: [0, 0, 0, 0],
        backgroundColor: [
          'rgb(28, 253, 133)',
          'rgb(60, 73, 222)',
          'rgb(90, 57, 113)',
          'rgb(154, 111, 175)',
        ],
        borderColor: [
          'rgb(28, 253, 133)',
          'rgb(60, 73, 222)',
          'rgb(90, 57, 113)',
          'rgb(154, 111, 175)',
        ],
        borderWidth: 1
      }]
    };

    // config 
    const configpie3 = {
      type: 'pie',
      data: datapie3,
      options: {}
    };

    const pieChart3 = new Chart(
      document.getElementById('pieChart3'),
      configpie3
    );
  </script>
  <script>{{-- linechart --}}
    const dataline = {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Earnings',
        data: [18, 12, 6, 9, 12, 3, 9],
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1
      }]
    };

    // config 
    const configline = {
      type: 'line',
      data: dataline,
      options: {}
    };

    // render pie chart
    const lineChart = new Chart(
      document.getElementById('lineChart'),
      configline
    );
  </script>
  <script>
    $(document).ready(function() {
      $('input[type="checkbox"]').click(function() {
        var inputValue = $(this).attr("value");
        $("." + inputValue).toggle();
      });
    });
  </script>
@endpush
