TotalCoin
=====

Ruby SDK para la API de TotalCoin

# Descripción

Ruby SDK para interactuar con la API de TotalCoin https://www.totalcoin.com.ar/

# Ejemplos de uso

1. Creación del objeto API:

```
$LOAD_PATH << '/lib'
require 'totalcoin'

api = TotalCoin::Api.new("CLIENT_EMAIL", "API_KEY")

```

2. Checkout:

```
$LOAD_PATH << '/lib'
require 'totalcoin'

data = {
  "Amount" => 100,
  "Quantity" => 1,
  "Country" => "ARG",
  "Currency" => "ARS",
  "Description" => "Zapatillas adidas",
  "PaymentMethods" => "CREDITCARD|CASH|TOTALCOIN",
  "Reference" => "0129618531",
  "Site" => "WordPress"
}

response = api.perform_checkout(data)

puts response[:URL]

```
3. Listado de Merchants:

```
$LOAD_PATH << '/lib'
require 'totalcoin'

response = api.get_merchants

puts response[:Response]

```
4. Informacion sobre Estado de Compras (Necesario en integración de IPN):

```
$LOAD_PATH << '/lib'
require 'totalcoin'

response = api.get_ipn_info("TOTALCOIN_ID")

puts response[:Response]

```
#Como correr los Tests

Se pueden encontrar dentro de la carpeta test/

1. Configuración

Dentro de totalcoin_test.rb Se deben asignar con los valores correspondientes, las variables:

- CLIENT_EMAIL
- API_KEY

2. Para poder ejecutar los tests se debe usar el siguiente comando de rake

```
rake test
```

Tener en cuenta que el modulo requiere la gema rest-client para interactuar con la api, en caso de no estar instalada ejecutar:

```
gem install rest-client
```
