

function notificationsChallengeAbc()
{ 
//	alert("ma fonction");
    var xmlhttp;
    if(window.XMLHttpRequest)
    {
//    	alert("ma fonction1");
        xmlhttp = new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
//    alert("ma fonction3");
    xmlhttp.open("GET","notificationsAbc",true);
//    xmlhttp.open("GET","challengeAaccepter",true);
//    xmlhttp.onreadystatechange = handleServerResponse;
//    alert("ma fonction3-1");
    xmlhttp.send();
//    alert("ma fonction3-2");

    xmlhttp.onreadystatechange = function()
    { 
//    	alert("ma fonction3-3");
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
//        	 alert("ma fonction4");

            var data = xmlhttp.responseText;
//            alert("le data:  "+data);
            if(data.trim().includes("no"))
            	
            {
//            	alert("ma fonction5");
            	
            	document.getElementById('challengesAaccepter').style.backgroundColor="#FFFBF0";
                document.getElementById('challengesAaccepter').style.border="1px solid grey";
                document.getElementById('challengesAaccepter').style.borderTop="none";
                document.getElementById('challengesAaccepter').style.borderRadius="6px";
                document.getElementById('challengesAaccepter').style.display="inline";
                document.getElementById('challengesAaccepter').style.textDecoration="none";
                document.getElementById('challengesAaccepter').style.marginTop="6px";
                document.getElementById('challengesAaccepter').innerHTML=data;
            }
            else
            { 
//            	alert("ma fonction6");
//            alert("le data dans la fonction 6:  "+data);
//            	$('#challengesAaccepter').tooltip(data);
//            document.getElementById('challengesAaccepter').tooltip(data);
            document.getElementById('challengesAaccepter').style.backgroundColor="#D3D3D3";
            document.getElementById('challengesAaccepter').style.border="1px solid grey";
            document.getElementById('challengesAaccepter').style.borderTop="none";
            document.getElementById('challengesAaccepter').style.borderRadius="6px";
            document.getElementById('challengesAaccepter').style.display="inline";
            document.getElementById('challengesAaccepter').style.textDecoration="none";
            document.getElementById('challengesAaccepter').style.marginTop="6px";
            document.getElementById('challengesAaccepter').style.marginLeft="55%";
            document.getElementById('challengesAaccepter').innerHTML=data;
            }
//            window.onblur= function() {window.onfocus= function () {location.reload(true)}};
        }
    }
}
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
function notificationsChallengeDico(){
//	alert("ma fonction ajouer");
    var xmlhttp;
    if(window.XMLHttpRequest)
    {
//    	alert("ma fonction1");
        xmlhttp = new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
//    alert("ma fonction3");
    xmlhttp.open("GET","notificationsDico",true);
//    xmlhttp.onreadystatechange = handleServerResponse;
//    alert("ma fonction3-1");
    xmlhttp.send();
//    alert("ma fonction3-2");

    xmlhttp.onreadystatechange = function()
    { 
//    	alert("ma fonction3-3");
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
//        	 alert("ma fonction4");

            var data = xmlhttp.responseText;
//            alert("le data:  "+data);
            if(data.trim().includes("no"))	
            {
//            	alert("ma fonction5");
            	document.getElementById('challengesAJouer').style.backgroundColor="#FFFBF0";
                document.getElementById('challengesAJouer').style.border="1px solid grey";
                document.getElementById('challengesAJouer').style.borderTop="none";
                document.getElementById('challengesAJouer').style.borderRadius="6px";
                document.getElementById('challengesAJouer').style.display="inline";
                document.getElementById('challengesAJouer').style.textDecoration="none";
                document.getElementById('challengesAJouer').style.marginTop="6px";
                document.getElementById('challengesAJouer').innerHTML=data;
            }
            else
            { 
//            	alert("ma fonction6");
//            alert("le data dans la fonction 6:  "+data);
            document.getElementById('challengesAJouer').style.backgroundColor="#D3D3D3";
            document.getElementById('challengesAJouer').style.border="1px solid grey";
            document.getElementById('challengesAJouer').style.borderTop="none";
            document.getElementById('challengesAJouer').style.borderRadius="6px";
            document.getElementById('challengesAJouer').style.display="inline";
            document.getElementById('challengesAJouer').style.textDecoration="none";
            document.getElementById('challengesAJouer').style.marginTop="6px";
//            document.getElementById('challengesAJouer').style.marginLeft="70%";
            document.getElementById('challengesAJouer').innerHTML=data;
            }
//            window.onblur= function() {window.onfocus= function () {location.reload(true)}};
        }
    }
}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
function notificationsChallengeSujets(){
//	alert("ma fonction ajouer");
    var xmlhttp;
    if(window.XMLHttpRequest)
    {
//    	alert("ma fonction1");
        xmlhttp = new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
//    alert("ma fonction3");
    xmlhttp.open("GET","notificationsSujets",true);
//    xmlhttp.onreadystatechange = handleServerResponse;
//    alert("ma fonction3-1");
    xmlhttp.send();
//    alert("ma fonction3-2");

    xmlhttp.onreadystatechange = function()
    { 
//    	alert("ma fonction3-3");
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
//        	 alert("ma fonction4");

            var data = xmlhttp.responseText;
//            alert("le data:  "+data);
            if(data.trim().includes("no"))	
            {
//            	alert("ma fonction5");
            	document.getElementById('challengesAJouer').style.backgroundColor="#FFFBF0";
                document.getElementById('challengesAJouer').style.border="1px solid grey";
                document.getElementById('challengesAJouer').style.borderTop="none";
                document.getElementById('challengesAJouer').style.borderRadius="6px";
                document.getElementById('challengesAJouer').style.display="inline";
                document.getElementById('challengesAJouer').style.textDecoration="none";
                document.getElementById('challengesAJouer').style.marginTop="6px";
                document.getElementById('challengesAJouer').innerHTML=data;
            }
            else
            { 
//            	alert("ma fonction6");
//            alert("le data dans la fonction 6:  "+data);
            document.getElementById('challengesAJouer').style.backgroundColor="#D3D3D3";
            document.getElementById('challengesAJouer').style.border="1px solid grey";
            document.getElementById('challengesAJouer').style.borderTop="none";
            document.getElementById('challengesAJouer').style.borderRadius="6px";
            document.getElementById('challengesAJouer').style.display="inline";
            document.getElementById('challengesAJouer').style.textDecoration="none";
            document.getElementById('challengesAJouer').style.marginTop="6px";
//            document.getElementById('challengesAJouer').style.marginLeft="70%";
            document.getElementById('challengesAJouer').innerHTML=data;
            }
//            window.onblur= function() {window.onfocus= function () {location.reload(true)}};
        }
    }
}

