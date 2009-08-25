

function toggleUseOdometer(odomId)
{
    $(odomId + '-odom').toggle();
    
if($(odomId + '-odom').visible() == true)
	{
	    $(odomId + '-dist').disabled = true;
	}
    else
	{
	    $(odomId + '-dist').disabled = false;
	}

}