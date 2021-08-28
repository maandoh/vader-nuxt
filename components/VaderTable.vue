<template>
  <table class="w-full text-left overflow-hidden -mx-5 md:mx-0">
    <thead>
    <tr>
      <th>Compound</th>
      <th class="text-right">{{vaderData.compound}}</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>Negative</td>
      <td class="text-right">{{vaderData.neg}}</td>
    </tr>
    <tr>
      <td>Neutral</td>
      <td class="text-right">{{vaderData.neu}}</td>
    </tr>
    <tr>
      <td>Positive</td>
      <td class="text-right">{{vaderData.pos}}</td>
    </tr>
    </tbody>
  </table>
</template>
<script>
  export default {
    props: ['vaderData'],
  }
</script>
<style>
  table{
  margin:0;
  }
  th {
    @apply border-b py-2;
  }
</style>
