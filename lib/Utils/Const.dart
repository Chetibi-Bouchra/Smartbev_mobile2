const stripePublishableKey =
    "pk_test_51MoidVHNNef0nI46ZNOxPKZMEZZdE6MFCUeIvUxfbFw8xMziGWcYWV4zfRBk9kwaWdR27QqXp3NHKRH3PgcIDF0H00eApWtjzL";
const secretKey =
    "sk_test_51MoidVHNNef0nI46xUh9zDxSkM1boBYi4dsk34pwiUYQXCVNOlgvJW4SSi6I9e6rKsfuhVHXjPZ6sH9QhunJ9jG500OJ5LxZkQ";

const apiURL = 'https://cuppa.onrender.com';

const reclamationEntry = '$apiURL/reclamation';
const createReclamation = '$reclamationEntry/createReclamation';

const paymentEntry = '$apiURL/payment';
const createPaymentIntent = '$paymentEntry/create-payment-intent';
const stripeAPI = 'https://api.stripe.com/v1/payment_methods';

const getPayments = '$paymentEntry/get-payments';

const accountManagementEntry = '$apiURL/api/account.management';
const createConsommateurAccount =
    '$accountManagementEntry/createConsommateurAccount';

const getCurrencies = 'https://api.exchangerate.host/symbols';
const convertCurrencyURL =
    'https://api.exchangerate.host/convert?from=EUR&to=DZD&amount=2';

const commandesEntry = '$apiURL/commandes';
