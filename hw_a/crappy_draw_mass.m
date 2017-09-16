function crappy_draw_mass(handles)
    w = 2;
    h = 2;

    % define pts
    pts = [0, w, w, 0;
        0, 0, h, h];
    
    % Translation matrix
    z = get(handles.z_slider,'Value');
    T = [z, z, z, z;
        0, 0, 0, 0];
    
    % Translate points, store in vectors
    pts = pts + T;
    X = pts(1,:);
    Y = pts(2,:);

    patch(handles.mass_plot);
    fill(X,Y,'r');
    set(handles.mass_plot,'XLim',[0 20],'YLim',[0 6])
    
    
end