function showAddCategoryDialog(dialog, jspPath, parentCategory) {

	if (dialog.size() > 1) {
		dialog = dialog.first();
	}

	if (!dialog.hasClass('DIALOG_CREATED')) {
		dialog.append(jQuery("<iframe style='border:none; width:450px; height: 300px' />").attr("src", jspPath + "?parent=/.categories/" + parentCategory));
		dialog.addClass('DIALOG_CREATED');
		dialog.dialog({
			title: 'Добавление новой категории',
			autoOpen: true,
			width: 500,
//			height:auto,
			buttons: {},
			modal: true
//			close: function (event, ui) {
//				window.location.reload();
//			}
		});

		$('.ui-dialog').css('z-index', '11111111111111111');
	} else {
		dialog.dialog('open');
	}

}