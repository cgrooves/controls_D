function crappy_draw_mass(handles)
    w = 3;
    h = 3;

    % define pts
    pts = [6, 6+w, 6+w, 6;
        0, 0, h, h];
    
    % Translation matrix
    z = get(handles.z_slider,'Value');
    T = [z, z, z, z;
        0, 0, 0, 0];
    
    % Translate points, store in vectors
    pts = pts + T;
    X = pts(1,:);
    Y = pts(2,:);
    
    spring_x = linspace(0,X(1),8);
    spring_y = [3, 2, 3, 2, 3, 2, 3, 2];
    
    
    patch(handles.mass_plot);
    fill(X,Y,'r');
    set(handles.mass_plot,'XLim',[0 20],'YLim',[0 12])
    line([0 X(1)],[1, 1])
    line(spring_x, spring_y);
    
    
    
end