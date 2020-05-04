@extends('layouts.front')
@section('content')

    <v-container >

    <v-row align="center" justify="center">
        <v-col cols="6">

        <v-card dark color="info" >
            <v-card-title class="display-1">
            {{ $tipo }} 
            </v-card-title>

            <v-card-text >
             {{ $mensaje }}
            </v-card-text>

            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn dark small color="amber"><v-icon>mdi-mail</v-icon> Reenviar Codigo</v-btn>
                <v-btn dark small color="success"><v-icon>mdi-account</v-icon> login</v-btn>
            </v-card-actions>
            
        </v-card>

        </v-col>
    </v-row>

    </v-container>
    
@endsection