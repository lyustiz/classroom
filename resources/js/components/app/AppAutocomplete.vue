<template>
    <v-autocomplete
      :label="label"
      :v-model="field"
      @focus="focusEventHandler"
      @blur="blurEventHandler"
      :prepend-inner-icon="prependIcon"
      append-icon="search"
      :hint="hint"
      :items="items"
      :item-text="itemText"
      :search-input.sync="searchItems"
    ></v-autocomplete>
</template>

<script>
export default 
{
    props: 
    {
        model: 
        { 
            type: String, 
            default: "" 
        },
        label: 
        { 
            type: String, 
            default: "" 
        },
        searchUrl: 
        { 
            type: String, 
            required: true 
        },
        hint: 
        { 
            type: String, 
            default: "" 
        },
        itemText: 
        { 
            type: String, 
            required: true 
        },
        prependIcon: 
        { 
            type: String, 
            default: "receipt" 
        },
        searchTrigger: 
        {
            type: Number,
            default: 3,
            validator: value => 
            {
                return value > 0 ? true : false;
            }
        }
    },
    data() 
    {
        return {  
            items: [],  
            searchItems: null  
        };
    },
  computed: {
        field: {
            get: function() 
            {
                return this.model;
            },
            set: function(value) 
            {
                this.$emit("fieldSetted", value);
            }
        }
    },
    watch: {
    searchItems(value) 
    {
        if (value && value.length >= this.searchTrigger) 
        {
            let url = `${this.$App.baseUrl}` + this.searchUrl + "/" + value;
            this.field = value;
            this.getResults(url, value);
        }
    }
  },
    methods: {
        focusEventHandler() 
        {
            this.$emit("fieldFocused");
        },
        blurEventHandler() 
        {
            this.$emit("fieldBlurred");
        },
        async getResults(url, value) 
        {
            await axios
            .get(url)
            .then(response => {
                if (response.status === 200 && response.data.results) 
                {
                    if (response.data.results.length > 0) 
                    {
                        this.items = response.data.results;
                    } else 
                    {
                        let object = {};
                        object[this.itemText] = value;
                        this.items = [object];
                    }
                }
            })
            .catch(error => 
            {
                console.log(error);
                alert("Error, por favor intente más tarde");
                window.location = "/home";
            });
        }
    }
};
</script>