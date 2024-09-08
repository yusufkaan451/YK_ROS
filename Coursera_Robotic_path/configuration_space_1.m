function flag = triangle_intersection(P1, P2)
    % triangle_intersection : returns true if the triangles overlap and false otherwise

    % Function to check if a point is inside a triangle using the barycentric method
    function isInside = point_in_triangle(pt, tri)
        x1 = tri(1,1); y1 = tri(1,2);
        x2 = tri(2,1); y2 = tri(2,2);
        x3 = tri(3,1); y3 = tri(3,2);
        xp = pt(1); yp = pt(2);

        % Compute vectors        
        v0 = [x3 - x1, y3 - y1];
        v1 = [x2 - x1, y2 - y1];
        v2 = [xp - x1, yp - y1];

        % Compute dot products
        dot00 = dot(v0, v0);
        dot01 = dot(v0, v1);
        dot02 = dot(v0, v2);
        dot11 = dot(v1, v1);
        dot12 = dot(v1, v2);

        % Compute barycentric coordinates
        invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
        u = (dot11 * dot02 - dot01 * dot12) * invDenom;
        v = (dot00 * dot12 - dot01 * dot02) * invDenom;

        % Check if point is in triangle
        isInside = (u >= 0) && (v >= 0) && (u + v < 1);
    end

    % Function to check if two line segments intersect
    function doesIntersect = line_intersection(p1, q1, p2, q2)
        function o = orientation(p, q, r)
            val = (q(2) - p(2)) * (r(1) - q(1)) - (q(1) - p(1)) * (r(2) - q(2));
            if val == 0
                o = 0; % collinear
            elseif val > 0
                o = 1; % clockwise
            else
                o = 2; % counterclockwise
            end
        end

        function onSegment = on_segment(p, q, r)
            onSegment = (q(1) <= max(p(1), r(1)) && q(1) >= min(p(1), r(1)) && ...
                         q(2) <= max(p(2), r(2)) && q(2) >= min(p(2), r(2)));
        end

        o1 = orientation(p1, q1, p2);
        o2 = orientation(p1, q1, q2);
        o3 = orientation(p2, q2, p1);
        o4 = orientation(p2, q2, q1);

        if (o1 ~= o2 && o3 ~= o4)
            doesIntersect = true;
            return;
        end

        if (o1 == 0 && on_segment(p1, p2, q1))
            doesIntersect = true;
            return;
        end
        if (o2 == 0 && on_segment(p1, q2, q1))
            doesIntersect = true;
            return;
        end
        if (o3 == 0 && on_segment(p2, p1, q2))
            doesIntersect = true;
            return;
        end
        if (o4 == 0 && on_segment(p2, q1, q2))
            doesIntersect = true;
            return;
        end

        doesIntersect = false;
    end

    % Check if any vertex of one triangle is inside the other triangle
    for i = 1:3
        if point_in_triangle(P1(i,:), P2) || point_in_triangle(P2(i,:), P1)
            flag = true;
            return;
        end
    end

    % Check if any edge of one triangle intersects with any edge of the other triangle
    edges1 = [1 2; 2 3; 3 1];
    edges2 = [1 2; 2 3; 3 1];
    for i = 1:3
        for j = 1:3
            if line_intersection(P1(edges1(i,1),:), P1(edges1(i,2),:), P2(edges2(j,1),:), P2(edges2(j,2),:))
                flag = true;
                return;
            end
        end
    end

    flag = false;
end


%% Code to call your function

% Provided test case
x = [1, 2, 1];
y = [1, 2, 3];
P1 = [x;y]';
x = [3, 4, 4];
y = [4, 2, 4];
P2 = [x;y]';

figure;
hold on;
line([P1(:,1)' P1(1,1)], [P1(:,2)' P1(1,2)], 'Color', 'r')
line([P2(:,1)' P2(1,1)], [P2(:,2)' P2(1,2)], 'Color', 'b')
hold off;

flag = triangle_intersection(P1, P2);
if flag == 1
    disp("Intersection")
else
    disp("No Intersection")
end

% Additional test cases
% Case 1
x = [2, 2, 3]; 
y = [5, 3, 4];
P1 = [x;y]';

x = [0, 4, 2];
y = [0, 4, 6];
P2 = [x;y]';

figure;
hold on;
line([P1(:,1)' P1(1,1)], [P1(:,2)' P1(1,2)], 'Color', 'r')
line([P2(:,1)' P2(1,1)], [P2(:,2)' P2(1,2)], 'Color', 'b')
hold off;

flag = triangle_intersection(P1, P2);
if flag == 1
    disp("Intersection")
else
    disp("No Intersection")
end

% Case 2
x = [1, 1, 3];
y = [1, 3, 2];
P1 = [x;y]';

x = [2, 2, 4];
y = [2, 4, 3];
P2 = [x;y]';

figure;
hold on;
line([P1(:,1)' P1(1,1)], [P1(:,2)' P1(1,2)], 'Color', 'r')
line([P2(:,1)' P2(1,1)], [P2(:,2)' P2(1,2)], 'Color', 'b')
hold off;

flag = triangle_intersection(P1, P2);
if flag == 1
    disp("Intersection")
else
    disp("No Intersection")
end

% Case 3
x = [0, 0, 2];
y = [0, 2, 1];
P1 = [x;y]';

x = [3, 3, 5];
y = [3, 5, 4];
P2 = [x;y]';

figure;
hold on;
line([P1(:,1)' P1(1,1)], [P1(:,2)' P1(1,2)], 'Color', 'r')
line([P2(:,1)' P2(1,1)], [P2(:,2)' P2(1,2)], 'Color', 'b')
hold off;

flag = triangle_intersection(P1, P2);
if flag == 1
    disp("Intersection")
else
    disp("No Intersection")
end

% Random Case
x = [1, 4, 2]; 
y = [1, 4, 6];
P1 = [x;y]';

x = [2, 5, 3];
y = [2, 5, 7];
P2 = [x;y]';

figure;
hold on;
line([P1(:,1)' P1(1,1)], [P1(:,2)' P1(1,2)], 'Color', 'r')
line([P2(:,1)' P2(1,1)], [P2(:,2)' P2(1,2)], 'Color', 'b')
hold off;

flag = triangle_intersection(P1, P2);
if flag == 1
    disp("Intersection")
else
    disp("No Intersection")
end
