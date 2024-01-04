<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
canvas {
	width: 500px !important;
	height: 250px !important;
}
</style>
<div class="d-flex chart-container">
	<canvas id="info-chart1"></canvas>
	<canvas id="info-chart2"></canvas>
</div>
<script>
	const ctx = document.getElementById('info-chart1');

	new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : [ 'Approved', 'Pending', 'Rejected' ],
			datasets : [ {
				label : 'User Status',
				data : [ 300, 10, 8 ],
				backgroundColor : [ 'rgb(0, 255, 0)', 'rgb(54, 162, 235)',
						'	rgb(255, 0, 0)' ],
				hoverOffset : 4
			} ]
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
</script>
