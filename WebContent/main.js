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

$("select.dateselector").change(function() {
     $('#filterform').submit();
});
$("select.typeselector").change(function() {
     $('#filterform').submit();
});

function TravelIndexChange() {
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "N") {
        sessionStorage.setItem("travelIndex", "1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "Y") {
        sessionStorage.setItem("travelIndex", "2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "N") {
        sessionStorage.setItem("travelIndex", "3");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "Y") {
        sessionStorage.setItem("travelIndex", "4");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "N") {
        sessionStorage.setItem("travelIndex", "5");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "Y") {
        sessionStorage.setItem("travelIndex", "6");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "N") {
        sessionStorage.setItem("travelIndex", "7");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "Y") {
        sessionStorage.setItem("travelIndex", "8");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "N") {
        sessionStorage.setItem("travelIndex", "9");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "Y") {
        sessionStorage.setItem("travelIndex", "10");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "N") {
        sessionStorage.setItem("travelIndex", "11");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "Y") {
        sessionStorage.setItem("travelIndex", "12");
    }

    if (sessionStorage.getItem("travelIndex") === "1") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "2") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "3") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "4") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "5") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "6") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "7") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "8") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "9") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "10") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "11") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
    if (sessionStorage.getItem("travelIndex") === "12") {
        $('div.travelshow').hide();
        $('div.travelshow').eq(sessionStorage.getItem("travelIndex")).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(sessionStorage.getItem("travelIndex")).show();
    }
}

$('select.TravelPri').change(function () {
    $('div.travelshow').hide();
    $('div.travelshow').eq(0).show();
    $('div.navbar a.upperR').hide();
    $('div.navbar a.upperR').eq(0).show();

    TravelIndexChange();
}).change();

$('select.TravelSub').change(function () {
    $('div.travelshow').hide();
    $('div.travelshow').eq(0).show();
    $('div.navbar a.upperR').hide();
    $('div.navbar a.upperR').eq(0).show();

    TravelIndexChange();
}).change();

document.getElementById('Hate').onclick = function () {
    if (sessionStorage.getItem("Hate") === "Y") {
        sessionStorage.setItem("Hate", "N");
    } else {
        sessionStorage.setItem("Hate", "Y");
    }
    TravelIndexChange();
}

if (document.getElementById('Hate') && sessionStorage.getItem("Hate") === null){
    sessionStorage.setItem("Hate", "N");
}