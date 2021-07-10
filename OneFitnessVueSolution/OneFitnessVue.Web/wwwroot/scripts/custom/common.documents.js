
$(document).ready(function () {
    bindDocument();
});

function bindDocument() {

    var requestdocument = { "MemberId": $("#MemberId").val() };

    $.ajax({
        type: 'POST',
        data: requestdocument,
        url: '/Service/Document/GetUploadedDocuments',
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                if (data.length == 0) {
                    $('#documentTable').empty();
                }
                else {
                    $('#documentTable').empty();
                    var temptable = '<table class="table table-bordered info"><thead> <tr> <th>Sr.no</th> <th>Document Name</th> <th>Download</th> <th>Delete</th> </tr></thead>';
                    var keycounter = 1;
                    $.each(data, function (key, val) {
                        var currentlocalhost = window.location.origin;
                        var downloadlink = "location.href='" + currentlocalhost + "/Service/Document/DownloadDocument?attachedDocumentId=" + val.ADId + "&MemberId=" + val.MemberId + "'";
                        temptable += '<tr> <td>' +
                            keycounter +
                            '</td>' +
                            '<td>' +
                            val.DocumentName +
                            '</td>' +
                            '<td>' +
                            '<a class="btn btn-info" href="javascript:void(0)" onclick=' + downloadlink + '>  <i class="fas fa-download"></i> Download </a>' +
                            '</td>' +
                            '<td>' +
                            "<a class='btn btn-danger' href='javascript:void(0)' onclick=deleteDocument('" + val.ADId + "','" + val.MemberId + "');> <i class='fas fa-trash'></i> Delete </a>" +
                            '</td>' +
                            '</tr>';
                        keycounter = keycounter + 1;
                    });
                    temptable += "</table>";
                    $('#documentTable').append(temptable);
                }
                
            }
        },
        error: function () {
            alert("Error loading data! Please try again.");
        }
    });
}

function deleteDocument(tempattachedDocumentId, memberId)
{
    var requestModel = { ADId: tempattachedDocumentId, MemberId: memberId };
    $("#divLoading").css("display", "block");
    $.confirm({
        title: 'Confirmation!',
        content: 'Do you want to Delete Document ?',
        type: 'red',
        typeAnimated: true,
        buttons: {
            confirm: {
                text: 'Delete',
                btnClass: 'btn-red',
                action: function () {

                    $.ajax({
                        type: "POST",
                        url: "/Service/Document/DeleteDocument",
                        data: requestModel,
                        success: function (data) {
                            if (data == "success") {
                                $.alert('Document Delete Successfully!');
                                window.location.reload();
                            }
                        },
                        error: function () {
                            alert("Error loading data! Please try again.");
                        }
                    });



                }
            },
            close: function () {
            }
        }
    });


}
function ValidateDocument() {
    $.confirm({
        title: 'Confirmation!',
        content: 'Do you want to Upload Document ?',
        type: 'green',
        buttons:
        {
            confirm: {
                text: 'Confirm',
                btnClass: 'btn-green',
                action: function () {
                    UploadDocument();
                    return true;
                },
                cancel: function () {
                    $.alert('Canceled!');
                }
            },
            close: function () {
            }
        }
    });
}

function UploadDocument()
{
    if ($("#AttachmentId").val() == "") {
        $.alert("Please Select Attachment Type");
    }
    else if ($("#Attachmentfile").val() == "") {
        $.alert("Please Select Attachment to Upload");
    }
    else {
        var formData = new FormData();
        var UploadDocs = document.getElementById("Attachmentfile").files[0];
        var token = $('input[name="__RequestVerificationToken"]').val();
        formData.append("__RequestVerificationToken", token);
        formData.append("AttachmentId", $("#AttachmentId").val());
        formData.append("attachmentfile", UploadDocs);
        formData.append("MemberId", $("#MemberId").val());


        $("#divLoading").css("display", "block");

        $.ajax({
            type: "POST",
            url: '/Service/Document/DocumentUpload',
            data: formData,
            headers: { 'x-l-token': 'xxxxx' },
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (data) {

                if (data.Result == "Success") {
                    $("#divLoading").css("display", "none");

                    $.confirm({
                        title: 'Message',
                        content: data.Message,
                        type: 'green',
                        typeAnimated: true,
                        buttons:
                        {
                            Ok: function () {
                                window.location.reload();
                            }
                        }
                    });
                }
                else if (data.Result == "Error") {
                    $("#divLoading").css("display", "none");
                    $.alert(
                        {
                            title: 'Message!',
                            type: 'red',
                            content: data.Message
                        });

                }
                else if (data.Result == "InvalidRequest") {
                    $("#divLoading").css("display", "none");
                    $.confirm({
                        title: 'Message',
                        content: data.Message,
                        type: 'green',
                        typeAnimated: true,
                        buttons: {
                            Ok: function () {
                                window.location.href = data.Path;
                            }
                        }
                    });
                }
            }

        });

    }

    
}

$(document).ready(function() {

    $("#btnContinue").click(function ()
    {
        SubmitDocuments();
    });

});

function SubmitDocuments()
{
    $("#divLoading").css("display", "block");
    var requestModel = { MemberId: $("#MemberId").val() };

    $.ajax({
        type: "POST",
        url: '/Service/Document/SubmitDocument',
        data: requestModel,
        headers: { 'x-l-token': 'xxxxx' },
        dataType: 'json',
     
        success: function (data) {

            if (data.Result == "Success")
            {
                $("#divLoading").css("display", "none");
                $.confirm({
                    title: 'Message',
                    content: data.Message,
                    type: 'green',
                    typeAnimated: true,
                    buttons:
                    {
                        Ok: function () {
                            window.location.href = data.Path;
                        }
                    }
                });
            }
            else if (data.Result == "Error") {
                $("#divLoading").css("display", "none");
                $.alert(
                    {
                        title: 'Message!',
                        type: 'red',
                        content: data.Message
                    });

            }
            else if (data.Result == "InvalidRequest")
            {
                $("#divLoading").css("display", "none");
                $.confirm({
                    title: 'Message',
                    content: data.Message,
                    type: 'green',
                    typeAnimated: true,
                    buttons: {
                        Ok: function () {
                            window.location.href = data.Path;
                        }
                    }
                });
            }
        }

    });
}

