paypal.Buttons({
    style: {
        color: 'blue',
        shape: 'pill'
        

    },
    creatrOrder: function (data, actions) {
        return actions.order.creatr({
            purchase_units: [{
                amount: {
                    value: '0.1'
                }
            }]
        });
    },
    onApprove: function (data, actions) {
        return actions.order.capture().then(function (details) {
            console.log(details);
            window.location.replace("PayementSuccessfull.jsp");
        });
    },
    onCancel: function (data) {
        window.location.replace("PayementFailed.jsp");
    }
}

).render("#paypal-payement-button");