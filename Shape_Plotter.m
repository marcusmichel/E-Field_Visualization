clc; clear

% Shape file to be plotted
Shape = dlmread('/Users/marcusmichel/Projects/SimulationCode/ddscat7.3.2/Shapefiles/Experiment/shape.dat','%t',7,0);
% Shape = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/10nm_JRD1/10nmds_JRD1.dat','%t',7,0);

sz = size(Shape);

colors = zeros(sz(1),3);

for i = 1:sz(1)
    %I have both 1 and 2 indexes set to yellow since these are the gold
    %rails. They should be different colors if the two are not the same
    %material.
    if Shape(i,6) == 1
        colors(i,:) = [1 1 0];
    end
    
    if Shape(i,6) == 2
        colors(i,:) = [1 1 0];
    end
    %This is the substrate
    if Shape(i,6) == 3
        colors(i,:) = [0 0 1];
    end
    %This is the chromophore
    if Shape(i,6) == 4
        colors(i,:) = [0 .5 0];
    end
    %This is another color
    if Shape(i,6) == 5
        colors(i,:) = [0 1 1];
    end
end
subplot(1,3,1)
scatter(Shape(:,2),Shape(:,3),[],colors)
xlabel('length_x(dipoles)')
ylabel('length_y(dipoles)')
axis equal
title('Top View')

subplot(1,3,2)
scatter(Shape(:,2),Shape(:,4),[],colors)
xlabel('length_x(dipoles)')
ylabel('length_z(dipoles)')
axis equal
title('Side View')

subplot(1,3,3)
figure()
scatter(Shape(:,3),Shape(:,4),[],colors)
xlabel('length_y(dipoles)')
ylabel('length_z(dipoles)')
axis equal

title('Front View')
