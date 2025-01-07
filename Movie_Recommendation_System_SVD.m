clear all;
close all;
%SVD Recommendation System for Movies
%Columns represent different genres
%Rows represent different movies
%The values are the user ratings accordingly
Data=[9 1 1 0 0 2;
      8 2 0 0 0 0;
      7 3 2 0 0 0;
      7 1 0 0 0 0;
      1 9 0 0 0 0;
      1 8 0 0 0 0;
      0 0 9 1 0 0;
      0 0 8 3 0 0;
      0 0 6 0 0 0;
      0 0 7 1 0 0;
      0 0 0 8 0 0;
      0 0 0 7 0 0;
      0 1 0 0 9 1;
      0 0 0 0 7 1;
      0 0 0 0 2 7;
      1 0 0 0 3 10;
      0 0 0 0 0 5;
      0 0 0 0 1 8];

Movies={"Casino Royale","Avengers-Infinity War","Mission Impossible","Avengers-Endgame","Jurassic Park","Pirates of the Caribbean","Christmas Vacation","Borat","Mr Bean","Mr Bean Holiday","Room","Cast Away","National Treasure","The Da Vinci Code","A Quiet Place","The Lighthouse","Get Out","Dont Move"}
Genres={"Action Movies","Adventure Movies","Comedy Movies","Drama Movies","Mystery","Horror Movies"}
[m,n]=size(Data);
r=rank(Data);
[U,S,V]=svd(Data);
U=-U;
V=-V;
j=n;
Vt=V';
V_j=Vt(1:j,:);
Decision=input("Select a genre\n 1)Action \n 2)Adventure \n 3)Comedy \n 4)Drama \n 5)Mystery \n 6)Horror \n")
W_M=[0 0 0 0 0 0];
W_M(1,Decision)=8;
Working_Model=W_M*V_j';
Working_Model=abs(Working_Model);
[M1,val1]=max(Working_Model)
fprintf("Recommended")
Genres(Decision)
user={};
Y=[];
[p11,n11]=size(user);
Num=1;
while true
    if Num~=1
        c=input("Do you want to watch another movie(1/0):")
        if c==0
            break;
        end
    end
    if Num==1
        c=input("Do you want watch to a movie(1/0):")
        if c==0
            break;
        end
        Num=Num+1;
    end
    H={};
    M={};
    L={};
    All={};
    for i=1:m
        N=Data(i,:)*V_j';
        N=abs(N)
        [Mm,Val]=max(N);
        if Val==val1
            if Mm>=M1
                [p1,n1]=size(H);
                H(n1+1)=Movies(i);
            end
            if Mm>=M1-1 & Mm<M1
                [p2,n2]=size(M);
                M(n2+1)=Movies(i);
            end
            if Mm>0 & Mm<M1-1
                [p3,n3]=size(L);
                L(n3+1)=Movies(i);
            end
        end
    end
    [p4,n4]=size(H);
    [p5,n5]=size(M);
    [p6,n6]=size(L);
    fprintf("Higher Rated ones")
    H
    fprintf("Medium Rated ones")
    M
    fprintf("Low Rated ones")
    L
    fprintf("Movies you have Watched")
    user
    All={};
    for t1=1:n4
        [p7,n7]=size(All);
        All(n7+1)=H(t1);
    end
    for t2=1:n5
        [p8,n8]=size(All);
        All(n8+1)=M(t2);
    end
    for t3=1:n6
        [p9,n9]=size(All);
        All(n9+1)=L(t3);
    end
    fprintf("Selected Movie")
    y=input("Select a movie:");
    y
    [p11,n11]=size(user);
    user(n11+1)=All(y)
    [p11,n11]=size(user);
    [p12,n12]=size(All);
    u=1:n12;
    [p13,n13]=size(Y);
    Y(1,n13+1)=y;
    [p13,n13]=size(Y);
    for i=1:n13
        u(1,Y(i))=0;
    end
    fprintf("Movies yet to watch")
    [p14,n14]=size(u);
    for i=1:n14
        if u(i)==0
            continue
        else
            All{i}
        end
    end
end
