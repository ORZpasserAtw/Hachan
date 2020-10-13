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
        sessionStorage.setItem("travelIndex", "1");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "2");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "3");
    }

    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "4");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "5");
    }
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "6");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "7");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "8");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "9");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "10");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "11");
    }
    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "12");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "13");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "14");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "15");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "1") {
        sessionStorage.setItem("travelIndex", "16");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "2") {
        sessionStorage.setItem("travelIndex", "17");
    }
    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2 && sessionStorage.getItem("Hate") === "3") {
        sessionStorage.setItem("travelIndex", "18");
    }

    if (sessionStorage.getItem("travelIndex") !== 'undefined') {
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