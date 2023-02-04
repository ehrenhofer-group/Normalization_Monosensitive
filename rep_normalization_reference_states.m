function [S_ref, swelling_ref] = rep_normalization_reference_states(stimulus, swelling_function)
% Searching of the inflexion point for the reference state

% swelling_function = app.swelling_function
% stimulus = app.stimulus

if isequal(class(swelling_function),'cfit')
    [first_derivative_rasterized, second_derivative_rasterized] = differentiate(swelling_function, stimulus);
    swelling_function_rasterized = feval(swelling_function, stimulus);
else
    
    % Differentiate the fitting object.
    first_derivative = diff(swelling_function, 1);
    first_derivative_rasterized = double(first_derivative(stimulus));
    second_derivative = diff(swelling_function, 2);
    second_derivative_rasterized = double(second_derivative(stimulus));
    % Rasterize the swelling function
    swelling_function_rasterized = double(swelling_function(stimulus));
    
end


figure(22)
subplot(1, 3, 1);
plot(stimulus, swelling_function_rasterized)
title('Swelling');

subplot(1, 3, 2) % erste Ableitung %figure%title('');xlabel('Temperature');ylabel('First Derivative');matlab2tikz( './output/derivative_1.tikz' , 'height', '\figureheight', 'width', '\figurewidth' )
plot(stimulus, first_derivative_rasterized)
title('1st derivative');

subplot(1, 3, 3) % zweite Ableitung %figure%title('');xlabel('Temperature');ylabel('Second Derivative');matlab2tikz( './output/derivative_2.tikz' , 'height', '\figureheight', 'width', '\figurewidth' )
plot(stimulus, second_derivative_rasterized)
title('2nd derivative');


% Identify rising or falling behavior
if swelling_function_rasterized(1) < swelling_function_rasterized(end) 
    % First value is smaller than last value: rising behavior
    disp 'rising'
    inflexion_point = find(max(first_derivative_rasterized) == first_derivative_rasterized, 1);
elseif swelling_function_rasterized(1) > swelling_function_rasterized(end)
    % Else: falling behavior
    disp 'falling'
    inflexion_point = find(min(first_derivative_rasterized) == first_derivative_rasterized, 1);
else
    errordlg 'Problem with rising or falling swelling behavior'
end

S_ref = stimulus(inflexion_point);





figure(22)
subplot(1, 3, 1);
plot(stimulus, swelling_function_rasterized, S_ref, swelling_function_rasterized(inflexion_point), 'or' )
title('Swelling');

subplot(1, 3, 2) % erste Ableitung %figure%title('');xlabel('Temperature');ylabel('First Derivative');matlab2tikz( './output/derivative_1.tikz' , 'height', '\figureheight', 'width', '\figurewidth' )
plot(stimulus, first_derivative_rasterized, S_ref, first_derivative_rasterized(inflexion_point), 'or' )
title('1st derivative');

subplot(1, 3, 3) % zweite Ableitung %figure%title('');xlabel('Temperature');ylabel('Second Derivative');matlab2tikz( './output/derivative_2.tikz' , 'height', '\figureheight', 'width', '\figurewidth' )
plot(stimulus, second_derivative_rasterized, S_ref, second_derivative_rasterized(inflexion_point), 'or' )
title('2nd derivative');
%close(22)


% zugehöriger Referenz-Durchmesser
swelling_ref = swelling_function_rasterized(inflexion_point);

end