function drawMassSystem(u)
    % process inputs to function
    z = u(1);
    t = u(2);

    % drawing parameters
    w = 2;
    h = 2;
    L = 10;
    
    % define persistent handle
    persistent mass_handle;
    
    % at time t 0, initialize plot and persistent vars
    if t==0
        figure(1),clf
        plot([0,2*L],[0,0],'k--');
        hold on
        mass_handle = drawMass(z,w,h,[]);
        axis([0, 2*L, -0.25*L, 2*L]);
    % at every other time, redraw the graphic
    else
        drawMass(z,w,h,mass_handle);
    end
end