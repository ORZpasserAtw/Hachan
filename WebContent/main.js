$('.cardview.managerId').on('press', function (e) {
    if (confirm('確定刪除嗎?')) {
        document.getElementById('Manager').submit();
        $(this).hide();
    } else {
        location.reload();
    }
});

$('.cardview.accountId').on('press', function (e) {
	
});

function accountdelsend(){
	if (confirm('確定刪除嗎?')) {
       document.getElementById('Account').del.value='Y';
		document.getElementById('Account').submit();
    } else {
        location.reload();
    }
}
function accountmodsend(){
	document.getElementById('Account').mod.value='Y';
	document.getElementById('Account').submit();
}

function managerdelsend(){
	if (confirm('確定刪除嗎?')) {
       document.getElementById('Manager').del.value='Y';
		document.getElementById('Manager').submit();
    } else {
        location.reload();
    }
}
function managermodsend(){
	document.getElementById('Manager').mod.value='Y';
	document.getElementById('Manager').submit();
}

$("select.dateselector").change(function() {
     $('#filterform').submit();
});
$("select.typeselector").change(function() {
     $('#filterform').submit();
});


function TravelIndexChange() {
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "NA1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "NA2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "NA3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "NS1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "NS2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "NS3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "NO1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "NO2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "NO3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "MA1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "MA2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "MA3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "MS1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "MS2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "MS3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "MO1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "MO2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "MO3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "SA1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "SA2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "SA3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "SS1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "SS2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "SS3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "SO1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "SO2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "SO3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "EA1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "EA2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "EA3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "ES1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "ES2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "ES3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "EO1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "EO2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 3 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "EO3");
    }
// 
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "NP1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "NP2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "NP3");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "MP1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "MP2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "MP3");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "SP1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "SP2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "SP3");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "EP1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "EP2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 4 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "EP3");
    }
// 
    if (sessionStorage.getItem("travelIndex") !== null) {
        $('div.tns-outer').hide();
        if (sessionStorage.getItem("travelIndex")==="NA1"){$('#NA-ow').show();}
        else if (sessionStorage.getItem("travelIndex")==="NS1"){
            $('#NS-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="NO1"){
            $('#NO-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="NP1"){
            $('#NP-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="MA1"){
            $('#MA-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="MS1"){
            $('#MS-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="MO1"){
            $('#MO-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="MP1"){
            $('#MP-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="SA1"){
            $('#SA-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="SS1"){
            $('#SS-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="SO1"){
            $('#SO-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="SP1"){
            $('#SP-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="EA1"){
            $('#EA-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="ES1"){
            $('#ES-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="EO1"){
            $('#EO-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="EP1"){
            $('#EP-ow').show();
        }
        $('#XX').hide();
       /*  $('div.travelshow').hide();
        $('div.navbar a.upperR').hide();
        $("#"+sessionStorage.getItem("travelIndex")+".travelshow").show();
        $("#"+sessionStorage.getItem("travelIndex")+".upperR").show(); */
    }else{
        $('div.tns-outer').hide();
        $('#XX').show();
        /* $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(0).show(); */
    }
}

$('select.TravelPri').change(function () {
    TravelIndexChange();
}).change();

$('select.TravelSub').change(function () {
    TravelIndexChange();
}).change();

document.getElementById('Hate').onclick = function () {
    if (sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("Hate", "2");
    } else if (sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("Hate", "3");
    } else if (sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("Hate", "1");
    }
    TravelIndexChange();
}

if (document.getElementById('Hate') && sessionStorage.getItem("Hate") === null){
    sessionStorage.setItem("Hate", "1");
}