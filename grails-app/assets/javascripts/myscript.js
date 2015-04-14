/**
 * Created by metabrain on 13/04/2015.
 */

function populateError(response) {
    alert("Something went wrong, please try again.");
}

function populateTxns(response) {
    //Hide table while we fill it in
    $("#person-txns").hide();

    //Update the transactions of that user
    $("#person-txns tbody").empty();
    for(var i = 0; i < response['txns'].length ; i++) {
        var txn = response['txns'][i];

        var parity = (i%2==0) ? "even" : "odd";
        var $row = $('<tr class="'+parity+'">');

        $row.append($('<td class="txn-amount">').text(txn['amount']));
        $row.append($('<td>').text(txn['receiver-name']));
        $row.append($('<td>').text(txn['sender-name']));

        $("#person-txns tbody").append($row);
    }

    // Update the name and balance of the person
    $('#person-txns .person-name').text(response['person']['name'])
    $('#person-txns .person-balance').text(response['person']['balance'])

    //At last, display table again
    $("#person-txns").show();
}
function fetchPersonTxns(person_id) {
    $.ajax({
        url: "/parreira/person/getTxns/?id=" + person_id,
        type: "GET",
        dataType: 'json',
        timeout: 5000,
        success: populateTxns,
        error: populateError
    });
}

$(document).ready(function() {
    $("#person").change(function() {
        var person_id = this.value;
        fetchPersonTxns(person_id);
    });
});
