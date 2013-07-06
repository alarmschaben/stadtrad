/*
$.ajax({
    type: "GET",
url: "data/temperature24h.xml",
dataType: "xml",
success: function(xml) {
    var series = []

    //define series
    $(xml).find("entry").each(function() {
        var seriesOptions = {
            name: $(this).text(),
    data: []
        };
        options.series.push(seriesOptions);
    });
);
*/
$(function () {
    $('#container').highcharts({
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Fruit Consumption'
        },
        xAxis: {
            categories: ['Apples', 'Bananas', 'Oranges']
        },
        yAxis: {
            title: {
                text: 'Fruit eaten'
            }
        },
        series: [{
            name: 'Jane',
        data: [1, 0, 4]
        }, {
            name: 'John',
        data: [5, 7, 3]
        }],
    });
});
