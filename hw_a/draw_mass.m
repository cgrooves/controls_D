function draw_mass(z,w,h,handle)

    pts = [0, w, w, 0;
        0, 0, h, h]; % original points defining mass box
    
    T = [z, z, z, z;
        0,0,0,0]; % translation vector
    
    pts = pts + T; % update points based on translation
    X = pts(1,:);
    Y = pts(2,:); % extract X, Y coordinates
    
    if isempty(handle)
        handle = fill(X,Y,'r');
    else
        set(handle,'XData',X,'YData',Y);
    end
end
