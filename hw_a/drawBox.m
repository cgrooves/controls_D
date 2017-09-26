function drawBox(u)

    % get all the parameters
    u(1) = z;
    u(2) = plot_handle;
    
    w = 2;
    h = 2;
    L = 10;
    
    persistent first_init;
    first_init = 1;
    
    % at time t 0, initialize plot and persistent vars
    if first_init == 1
        plot(plot_handle,[0,2*L],[0,0],'k--');
        hold on
        plot_handle = drawMass(z,w,h,plot_handle);
        axis([0, 2*L, -0.25*L, 2*L]);
    % at every other time, redraw the graphic
    else
        drawMass(z,w,h,plot_handle);
    end
end