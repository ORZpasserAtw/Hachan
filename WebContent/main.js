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

    if (sessionStorage.getItem("travelIndex") !== null) {
        $('div.travelshow').hide();
        $('div.navbar a.upperR').hide();
        $("#"+sessionStorage.getItem("travelIndex")+".travelshow").show();
        $("#"+sessionStorage.getItem("travelIndex")+".upperR").show();
    }else{
        $('div.travelshow').hide();
        $('div.travelshow').eq(0).show();
        $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(0).show();
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