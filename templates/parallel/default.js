function init() {
    var tree = $("#tree");
    tree.append($("#markdown-toc"));

    $.jstree.defaults.core.themes.icons = false;
    $.jstree.defaults.core.multiple = false;
    tree.jstree()
        .on('changed.jstree', function (e, data) {
            location.href = data.node.a_attr.href;
        });

    $(tree.children()[0]).attr("id", "markdown-toc");
}