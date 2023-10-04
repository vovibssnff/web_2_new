const yField = document.getElementById("y_field");

yField.addEventListener("input", (event) => {
    const yValue = parseInt(yField.value);
    console.log("Y is " + yValue);
    if (isNaN(yValue)||yValue.toString()==="") {
        yField.setCustomValidity("Y must be a valid number");
    } else {
        if (yValue<-3||yValue>5) {
            yField.setCustomValidity("Y value should be in range [-3, 5]")
        } else {
            yField.setCustomValidity("");
        }
    }
});

$(document).ready(function() {
    $('#form').submit(function(event) {
        event.preventDefault(); // Prevent the default form submission

        // Get values from form elements
        var x = $('#x').val();
        var y = $('#y').val();
        var r = $('#r').val();

        // Send an AJAX GET request to the servlet
        $.get('ControllerServlet', { val_x: x, val_y: y, val_r: r }, function(data) {
            const t1 = performance.now();

            var now = new Date();
            var execution_time = t1-t0;
            var newData = { x: x, y: y, r: r, time: now, execution_time: execution_time, result: data };
            console.log(x, y, r);
            var newRow = '<tr>' +
                '<td>' + newData.x + '</td>' +
                '<td>' + newData.y + '</td>' +
                '<td>' + newData.r + '</td>' +
                '<td>' + newData.time + '</td>' +
                '<td>' + newData.execution_time + '</td>' +
                '<td>' + newData.result + '</td>' +
                '</tr>';
            $('#result-table tbody').append(newRow);
        });
    });
});
