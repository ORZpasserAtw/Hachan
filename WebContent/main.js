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
    $('div.navbar a.upperF').hide();
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1) {
        sessionStorage.setItem("travelIndex", "NA");
    }
    
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2) {
        sessionStorage.setItem("travelIndex", "NS");
    }

    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 3) {
        sessionStorage.setItem("travelIndex", "NO");
    }

    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 4) {
        sessionStorage.setItem("travelIndex", "NP");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1) {
        sessionStorage.setItem("travelIndex", "MA");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2) {
        sessionStorage.setItem("travelIndex", "MS");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 3) {
        sessionStorage.setItem("travelIndex", "MO");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 4) {
        sessionStorage.setItem("travelIndex", "MP");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1) {
        sessionStorage.setItem("travelIndex", "SA");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2) {
        sessionStorage.setItem("travelIndex", "SS");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 3) {
        sessionStorage.setItem("travelIndex", "SO");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 4) {
        sessionStorage.setItem("travelIndex", "SP");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 1) {
        sessionStorage.setItem("travelIndex", "EA");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 2) {
        sessionStorage.setItem("travelIndex", "ES");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 3) {
        sessionStorage.setItem("travelIndex", "EO");
    }
    
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 4) {
        sessionStorage.setItem("travelIndex", "EP");
    }

    if (sessionStorage.getItem("travelIndex") !== null) {
        $('div.tns-outer').hide();
        if (sessionStorage.getItem("travelIndex")==="NA"){
            $('#NA-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="NS"){
            $('#NS-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="NO"){
            $('#NO-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="NP"){
            $('#NP-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="MA"){
            $('#MA-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="MS"){
            $('#MS-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="MO"){
            $('#MO-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="MP"){
            $('#MP-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="SA"){
            $('#SA-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="SS"){
            $('#SS-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="SO"){
            $('#SO-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="SP"){
            $('#SP-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="EA"){
            $('#EA-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="ES"){
            $('#ES-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="EO"){
            $('#EO-ow').show();
        }
        else if (sessionStorage.getItem("travelIndex")==="EP"){
            $('#EP-ow').show();
        }
        $('#XX').hide();
        if (sessionStorage.getItem("buttonIndex").indexOf("0") !== -1 || sessionStorage.getItem("buttonIndex").indexOf("4") !== -1){
            $('div.navbar a.upperF').eq(0).show();
        }else{
            $("#"+sessionStorage.getItem("buttonIndex")+".upperF").show();
        }
       /*  $('div.travelshow').hide();
        $('div.navbar a.upperR').hide();
        $("#"+sessionStorage.getItem("travelIndex")+".travelshow").show();
        $("#"+sessionStorage.getItem("travelIndex")+".upperR").show(); */
    }else{
        $('div.navbar a.upperF').hide();
        $('div.tns-outer').hide();
        $('#XX').show();
        $('div.navbar a.upperF').eq(0).show();
        /* $('div.navbar a.upperR').hide();
        $('div.navbar a.upperR').eq(0).show(); */
    }
}

function ButtonIndexReset() {
    sliderNA.goTo(0);
    sliderNS.goTo(0);
    sliderNO.goTo(0);
    sliderNP.goTo(0);

    sliderMA.goTo(0);
    sliderMS.goTo(0);
    sliderMO.goTo(0);
    sliderMP.goTo(0);

    sliderSA.goTo(0);
    sliderSS.goTo(0);
    sliderSO.goTo(0);
    sliderSP.goTo(0);

    sliderEA.goTo(0);
    sliderES.goTo(0);
    sliderEO.goTo(0);
    sliderEP.goTo(0);

    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 1) {
        sessionStorage.setItem("buttonIndex", "NA1");
    }
    
    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 2) {
        sessionStorage.setItem("buttonIndex", "NS1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 3) {
        sessionStorage.setItem("buttonIndex", "NO1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 1 && document.getElementById("TravelSub").selectedIndex === 4) {
        sessionStorage.setItem("buttonIndex", "NP1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 1) {
        sessionStorage.setItem("buttonIndex", "MA1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 2) {
        sessionStorage.setItem("buttonIndex", "MS1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 3) {
        sessionStorage.setItem("buttonIndex", "MO1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 2 && document.getElementById("TravelSub").selectedIndex === 4) {
        sessionStorage.setItem("buttonIndex", "MP1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 1) {
        sessionStorage.setItem("buttonIndex", "SA1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 2) {
        sessionStorage.setItem("buttonIndex", "SS1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 3) {
        sessionStorage.setItem("buttonIndex", "SO1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 3 && document.getElementById("TravelSub").selectedIndex === 4) {
        sessionStorage.setItem("buttonIndex", "SP1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 1) {
        sessionStorage.setItem("buttonIndex", "EA1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 2) {
        sessionStorage.setItem("buttonIndex", "ES1");
    }

    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 3) {
        sessionStorage.setItem("buttonIndex", "EO1");
    }
    
    if (document.getElementById("TravelPri").selectedIndex === 4 && document.getElementById("TravelSub").selectedIndex === 4) {
        sessionStorage.setItem("buttonIndex", "EP1");
    }
}

$('select.TravelPri').change(function () {
    ButtonIndexReset();
    TravelIndexChange();
}).change();

$('select.TravelSub').change(function () {
    ButtonIndexReset();
    TravelIndexChange();
}).change();

var customizedFunction = function (info) {
    // direct access to info object
    sessionStorage.setItem("buttonIndex", info.container.id+(info.index+1));
    TravelIndexChange();
  }
  
  // bind function to event
  sliderNA.events.on('indexChanged', customizedFunction);
  sliderNS.events.on('indexChanged', customizedFunction);
  sliderNO.events.on('indexChanged', customizedFunction);
  sliderNP.events.on('indexChanged', customizedFunction);

  sliderMA.events.on('indexChanged', customizedFunction);
  sliderMS.events.on('indexChanged', customizedFunction);
  sliderMO.events.on('indexChanged', customizedFunction);
  sliderMP.events.on('indexChanged', customizedFunction);

  sliderSA.events.on('indexChanged', customizedFunction);
  sliderSS.events.on('indexChanged', customizedFunction);
  sliderSO.events.on('indexChanged', customizedFunction);
  sliderSP.events.on('indexChanged', customizedFunction);

  sliderEA.events.on('indexChanged', customizedFunction);
  sliderES.events.on('indexChanged', customizedFunction);
  sliderEO.events.on('indexChanged', customizedFunction);
  sliderEP.events.on('indexChanged', customizedFunction);