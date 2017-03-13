<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/template" class="template_release_button">
  <@ _.each( rc, function( nextStep ){ @>
      <@ if (nextStep.buttonEnabled==true) {@>
        <input type="button" class="btn btn-primary" id="btnRelease_<@- nextStep.conditionId @>" value="<@- nextStep.conditionName @>" onclick="release.turnNext(<@- nextStep.conditionId @>)">
      <@} else {@>
        <input type="button" class="btn btn-primary" disabled id="btnRelease_<@- nextStep.conditionId @>" value="<@- nextStep.conditionName @>" onclick="release.turnNext(<@- nextStep.conditionId @>)">
      <@} @>
  <@ }); @>
</script>
