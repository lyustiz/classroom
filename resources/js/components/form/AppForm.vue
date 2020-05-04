<template>

    <v-container fluid grid-list-md text-xs-center>

		<v-layout row justify-center>

			<v-flex xs12>

				<v-card :loading="loading">
				
					<template v-if="title">
						<v-card-title dark :color="(headColor) ? headColor : this.$App.theme.headForm">
							<h3 :class="(headColor) ? headColor : this.$App.theme.titleForm">
								{{title}}
							</h3>
							<v-spacer></v-spacer>
							<slot name="headButtons"></slot>
						</v-card-title>
					</template>

					<v-card-text>
						<v-layout wrap='false' justify-space-between>
							<slot name="fields"></slot>
						</v-layout>
					</v-card-text>

					<v-card-actions>
						<slot name="buttons"></slot>
					</v-card-actions>

				</v-card>

			</v-flex>

		</v-layout>

    </v-container>

</template>

<script>
export default {
	name: 'app-form',
	props: {
        title: {
            type: String,
            default: null
        },
        help: {
            type: String,
            default: null
        },
		headColor: {
            type: String,
            default: null
        },
        titleColor:{
            type: String,
            default: null
		},
		valid:{
            type: Boolean,
            default: false
		},
		loading:{
            type: Boolean,
            default: false
        },
	},

}
</script>
