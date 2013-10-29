var assets_selected_ids = [];
var assets_target = "";

function initAssetManager(){
    $("input[type=text]").focus(function(){
        assets_target = $(this);
        $("#select-assets-button").html("Select for " + $(this).attr("id"));
    });
    $(".asset-item").click(function(){
        var asset_id = $(this).attr("data-id");
        if (!$(this).hasClass("selected")) {
            assets_selected_ids.push(asset_id)
        } else {
            var index = assets_selected_ids.indexOf(asset_id);
            if (index > -1) assets_selected_ids.splice(index, 1);
        }
        $(this).toggleClass("selected");
        $("#selected-assets").html(assets_selected_ids.join(","));
    });
    $("#select-assets-button").click(function(){
        $(assets_target).val(assets_selected_ids.join(","));
    });
}




