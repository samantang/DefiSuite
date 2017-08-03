function previewUploadImage()
{
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("profilephoto").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("image_preview").src = oFREvent.target.result;
        };
};

function checkField()
{
    filename = document.form1.profilephoto.value;
    if(filename=="")
    {
        alert("Please Select an Image");
        return false;
    }
    extension =filename.substr(filename.lastIndexOf(".")+1);
    arr = ["jpg","JPG","png","jpeg","gif"];
    flag = 0;
    for(i=0;i<arr.length;i++)
    {
        if(arr[i] == extension)
        {
            flag = 1;
            break;
        }
    }
    if(flag == 0)
    {
        alert("Invalid Picture Format");
        document.form1.profilephoto.value="";
        return false;
    }
    else
    {
        
        return true;
    }
}
function suggest()
		{
			var xmlhttp;
			var elem = document.getElementById("searchbox").value;
			if(window.XMLHttpRequest)
			{
				xmlhttp = new XMLHttpRequest();
			}
			else if(window.ActiveXObject)
			{
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
                        xmlhttp.open("GET","search_suggest.jsp?elem="+elem,true);
			xmlhttp.send();
                        xmlhttp.onreadystatechange=function()
                        {
                                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                                    {
                                            var data = xmlhttp.responseText;
                                            if(data.trim()=="no")
                                            {
                                                document.getElementById('suggestion').style.backgroundColor="";
                                                document.getElementById('suggestion').style.border="";
                                                document.getElementById('suggestion').innerHTML="";
                                            }
                                            else
                                            {
                                                //document.getElementById('suggestion').style="border:2px solid black";
                                                document.getElementById('suggestion').style.backgroundColor="#FFFBF0";
                                                document.getElementById('suggestion').style.border="1px solid grey";
                                                document.getElementById('suggestion').style.borderTop="none";
                                                document.getElementById('suggestion').style.borderRadius="6px";
                                                document.getElementById('suggestion').style.display="inline";
                                                document.getElementById('suggestion').style.textDecoration="none";
                                                document.getElementById('suggestion').innerHTML=data;
                                            }
                                }
                            }

		}

function showRequest()
{
    var xmlhttp;
    if(window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("GET","show_friend_request.jsp",true);
    xmlhttp.send();

    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.readyState==4 && xmlhttp.status==200)
        {

            var data = xmlhttp.responseText;
            if(data.trim()=="no")
            {
                document.getElementById('showrequest').style.backgroundColor="";
                document.getElementById('showrequest').style.border="";
                document.getElementById('showrequest').innerHTML="";
            }
            else
            {
            document.getElementById('showrequest').style.backgroundColor="#FFFBF0";
            document.getElementById('showrequest').style.border="1px solid grey";
            document.getElementById('showrequest').style.borderTop="none";
            document.getElementById('showrequest').style.borderRadius="6px";
            document.getElementById('showrequest').style.display="inline";
            document.getElementById('showrequest').style.textDecoration="none";
            document.getElementById('showrequest').innerHTML=data;
            }
            window.onblur= function() {window.onfocus= function () {location.reload(true)}};
        }
    }
}
