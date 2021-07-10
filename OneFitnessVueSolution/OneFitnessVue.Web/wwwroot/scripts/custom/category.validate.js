$("#CategoryName").blur(function ()
{
    if ("" !== $("#CategoryName").val())
    {
        $.getJSON("/Administration/Category/CheckCategoryName",
            { categoryName: $("#CategoryName").val() },
            function(a) { a && (alert("CategoryName already Exists"), $("#CategoryName").val("")) });
    }
});