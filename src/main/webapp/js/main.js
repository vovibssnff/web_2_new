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

function sendRequest() {
    let val_x = $('#x').val();
    let val_y = $('#y').val();
    let val_r = $('#r').val();
    $.ajax({
        url: 'ControllerServlet',
        method: 'GET',
        data: {
            val_x: val_x,
            val_y: val_y,
            val_r: val_r
        },
        success: function (result) {
            let newRow = '<tr>' +
                '<td>' + val_x + '</td>' +
                '<td>' + val_y + '</td>' +
                '<td>' + val_r + '</td>' +
                '<td>' + 'i' + '</td>' +
                '<td>' + 'wanna' + '</td>' +
                '<td>' + 'pizza' + '</td>' +
                '</tr>';
            $('#result-table tbody').append(newRow);
        },
        error: function (jqXHR, exception) {
            console.log('Error occured!!');
        }
    });
}

// $(document).ready(function () {
//     $('#form').submit(function () {
//         let x = $('#x').val();
//         let y = $('#y').val();
//         let r = $('#r').val();
//         $.get('ControllerServlet', {
//             val_x: x,
//             val_y: y,
//             val_r: r
//         }, function (result) {
//             let res = result.split(", ");
//             let now = new Date();
//             let newData = { x: x, y: y, r: r, time: now, execution_time: res[0], result: res[1] };
//             console.log(x, y, r);
//             let newRow = '<tr>' +
//                 '<td>' + newData.x + '</td>' +
//                 '<td>' + newData.y + '</td>' +
//                 '<td>' + newData.r + '</td>' +
//                 '<td>' + newData.time + '</td>' +
//                 '<td>' + newData.execution_time + '</td>' +
//                 '<td>' + newData.result + '</td>' +
//                 '</tr>';
//             $('#result-table tbody').append(newRow);
//         });
//     });
//
// });