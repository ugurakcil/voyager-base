<div id="{{ $row->field }}_area"></div>

<template id="{{ $row->field }}_template">
<div class="bulk_list_group row mb-3" data-bulk-name="{{ $row->field }}">
  <div class="col-sm-5">
    <input class="form-control bulk_list_input bulk_list_input_name" type="text" placeholder="{{ __('generic.feature_name') }}">
  </div>

  <div class="col-sm-6">
    <input class="form-control bulk_list_input bulk_list_input_value" type="text" placeholder="{{ __('generic.feature_content') }}">
  </div>

  <div class="col-sm-1">
    <button type="button" class="btn btn-danger" type="button" onclick="removeBulkListLine(this)" style="width:100%; padding:15px;">
      <span class="voyager-trash"></span>
    </button>
  </div>
</div>
</template>

<input type="hidden"
      class="form-control" 
      data-type="bulk_list"
      name="{{ $row->field }}"
      data-name="{{ $row->display_name }}"
      @if($row->required == 1) required @endif 
      placeholder="{{ isset($options->placeholder)? old($row->field, $options->placeholder): $row->display_name }}"
      value="@if(isset($dataTypeContent->{$row->field})){{ old($row->field, $dataTypeContent->{$row->field}) }}@else{{old($row->field)}}@endif">

<div class="text-center mt-3">
  <button type="button" class="btn btn-primary rounded-circle" id="{{ $row->field }}_button">+</button>
</div>

<script language="javascript">
setTimeout(function(){
  createBulkList()
}, 200)

if(typeof createBulkList !== "function"){
  function createBulkList() {
    var bulkRaw = document.querySelectorAll("[data-type='bulk_list'");

    var logBulkListEventListeners = []

    for(var bulkListLoop = 0; bulkListLoop <= bulkRaw.length - 1; bulkListLoop++) {
      var currentBulkRaw = bulkRaw[bulkListLoop]
      var bulkName = currentBulkRaw.name
      document.getElementById(bulkName + "_area").innerHTML = '' // reset

      var oldData = oldDataFigureOut()

      if(oldData.length >= 1) {
        for(var i = 0; i <= oldData.length - 1; i++) {
          createLine(oldData[i])
        }
      }

      var buttonElm = document.getElementById(bulkName + '_button')
      buttonElm.addEventListener('click', createLine)
      logBulkListEventListeners.push([buttonElm, 'click', createLine])
    }

    if(document.querySelector('.language-selector') !== null) {
      var languageBtns = document.querySelectorAll('.language-selector label.btn')

      for(var langLoop = 0; langLoop <= languageBtns.length - 1; langLoop++) {
        function languageBtnsEventHandler() {
          removeEventListeners();

          setTimeout(function(){
            createBulkList()
          }, 200)
        }

        languageBtns[langLoop].addEventListener('click', languageBtnsEventHandler)
        logBulkListEventListeners.push([languageBtns[langLoop], 'click', languageBtnsEventHandler])
      }
    }

    function removeEventListeners() {
      for(var i = 0; i <= logBulkListEventListeners.length - 1; i++) {
        logBulkListEventListeners[i][0].removeEventListener(
          logBulkListEventListeners[i][1],
          logBulkListEventListeners[i][2]
        )
      }
    }

    function createLine(lineData = []) {
      var bulkListTemplate = document.getElementById(bulkName + "_template")
      var bulkListTemplateCopied = bulkListTemplate.content.cloneNode(true);

      var bulkListInputNameElem = bulkListTemplateCopied.querySelector('.bulk_list_input_name')
      var bulkListInputValueElem = bulkListTemplateCopied.querySelector('.bulk_list_input_value')

      if(lineData.length > 0) {
        bulkListInputNameElem.value = lineData[0]
        bulkListInputValueElem.value = lineData[1]
      }

      function updateBulkListDatabaseInputEventHandler() {
        updateBulkListDatabaseInput(bulkName)
      }

      bulkListInputNameElem.addEventListener('input', updateBulkListDatabaseInputEventHandler)
      logBulkListEventListeners.push([bulkListInputNameElem, 'input', updateBulkListDatabaseInputEventHandler])
      
      bulkListInputValueElem.addEventListener('input', updateBulkListDatabaseInputEventHandler)
      logBulkListEventListeners.push([bulkListInputValueElem, 'input', updateBulkListDatabaseInputEventHandler])

      document.getElementById(bulkName + "_area").appendChild(bulkListTemplateCopied);
    }

    function oldDataFigureOut() {
      var oldDataElem = document.querySelector("[name='"+bulkName+"']");

      var oldDataFigureOut = [];
      if(oldDataElem.value.length > 3) {
        var oldDataFigureOutLines = oldDataElem.value.split('¶¶¶');

        for(var i = 0; i <= oldDataFigureOutLines.length - 1; i++) {
          if(oldDataFigureOutLines[i].length < 3) {
            continue;
          }

          var oldDataFigureOut = oldDataFigureOut.concat([
            oldDataFigureOutLines[i].split('ßßß')
          ]);
        }
      }

      return oldDataFigureOut;
    }

    /*
    setInterval(() => {
      console.log(logBulkListEventListeners)
    }, 10000);
    */
  }
} // createBulkList()

if(typeof updateBulkListDatabaseInput !== "function"){
  function updateBulkListDatabaseInput(bulkName) {
    var bulkListArea = document.getElementById(bulkName + "_area")
    var bulkListAreaInputGroups = bulkListArea.querySelectorAll('.bulk_list_group .bulk_list_input')

    var collectBulkList = '';
    for(var i = 0; i <= bulkListAreaInputGroups.length - 1; i = i + 2) {
      collectBulkList += bulkListAreaInputGroups[i].value +'ßßß'+ bulkListAreaInputGroups[i+1].value+'¶¶¶';
    } 

    document.querySelector("[name='"+bulkName+"']").value = collectBulkList
  }
} // updateBulkListDatabaseInput()

if(typeof removeBulkListLine !== "function"){
  function removeBulkListLine(ev) {
    var isConfirmedRemove = confirm('Will be deleted. Are you sure?')

    if(!isConfirmedRemove) return;

    ev.parentNode.parentNode.remove()
    updateBulkListDatabaseInput(ev.parentNode.parentNode.getAttribute('data-bulk-name'))
  }
}
</script>