%% Objective: to test the robustness of the point location detection function
% Generate the grid of test points
xmin = 800;
xmax = 1655;
ymin = 800;
ymax = 1005;
zmin = 186;
zmax = 920;
step_x = 10;
step_y = 10;
step_z = 10;

counter = 1;
for x = xmin:step_x:xmax
	for y = ymin:step_y:ymax
		for z = zmin:step_z:zmax
			pntMat(counter,1) = x;
			pntMat(counter,2) = y;
			pntMat(counter,3) = z;
			counter = counter + 1;
		end
	end
end

%load particles
load('all_particles.mat');

result = PointLocation(particles,3,[14,18,26],pntMat);

hold on;
for i = 1:size(particles,2)
	particle = particles{1,i};
	for n = 1:size(particle,2)
		tempPatch = particle(n);
		nrbtriangulate(tempPatch,[20,20]);
	end
end
axis equal;
view(45,45);
hold off;

title('Sample Particle');
figure (2)
hold on;
for i = 1:size(result,1)
    if result(i,1) == 2
        scatter3(pntMat(i,1),pntMat(i,2),pntMat(i,3),'.', 'green'); % green means inside the particle surface
    elseif result(i,1) == 1
        scatter3(pntMat(i,1),pntMat(i,2),pntMat(i,3),'.', 'blue'); % blue means on the particle surface
    % else
    %     scatter3(pntMat(i,1),pntMat(i,2),pntMat(i,3),'.','red');
    end
end
view(45,45);
axis equal;
hold off;