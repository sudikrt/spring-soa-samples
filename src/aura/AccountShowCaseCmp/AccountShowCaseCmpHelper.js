({
	doInit : function(component, event) {
		let action = component.get ('c.getMostRecentAccount');
        action.setParams ({
            numOfAccount : 10
        });
        action.setCallback (this, function (response) {
            let state = response.getState ();
            if (state === 'SUCCESS') {
                let returnValue = response.getReturnValue ();
                if (returnValue && returnValue.length > 0) {
                    component.set ('v.acccountList', returnValue);
                } else {
                	component.set ('v.message', 'No records.');                    
                }
            } else {
                component.set ('v.message', 'Error in retrieving records');
                console.log ('Unabel to fetch the data');
            }
        });
        $A.enqueueAction (action);
	}
})