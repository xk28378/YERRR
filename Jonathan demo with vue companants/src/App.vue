<template>
  <div id="app">
    <country iso-code="CA" />
    <country iso-code="UK" />
    <country iso-code="CL" />
  </div>
</template>

<script>

import Country from "@/views/Country.vue";

export default {
  name: "app",
  components: { Country }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
.left {
  border: 2px solid black;
  width: 50vw;
}
.right {
  border: 2px solid blue;
  width: 50vw;
}
.hello {
  display: flex;
  text-align: center;
}
ul {
  list-style-type: none;
}
</style>
