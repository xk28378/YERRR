<template>
  <div>
    <h1>{{countryName}} ({{ isoCode }})</h1>
    <div></div>
  </div>
</template>

<script>
export default {
  name: "country",
  data: function () {
    return {
    };
  },
  computed: {
    countryName: function() {
      const countries = {
        "CA": "Canada",
        "UK": "United Kingdom",
        "CL": "Chile"
      }
      return countries[this.isoCode];
    }
  },
  props: ["isoCode"],
};
</script>