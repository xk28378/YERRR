<template>
  <div class="hello">
    <div class="left">
      <h3>Places</h3>
      <ul>
        <li>
          <router-link to="/">Home</router-link>
        </li>
        <li>
          <router-link to="/country/Brazil">Brazil</router-link>
        </li>
        <li>
          <router-link to="/country/Argentina">Argentina</router-link>
        </li>
        <li>
          <router-link to="/country/Peru">Peru</router-link>
        </li>
      </ul>
    </div>
    <div class="right">
      <h3>Nothing to show yet</h3>
    </div>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
