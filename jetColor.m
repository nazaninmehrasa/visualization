s = segs{1,30};
img = cat(3,s,s,s);
imshow(img);
uniq=unique(s);
colors=jet(size(uniq,1));
temp=[];
for i = 1:size(s,1)
for j = 1:size(s,2)
temp1(i,j,1)=colors(find(uniq==s(i,j)),1);
temp1(i,j,2)=colors(find(uniq==s(i,j)),2);
temp1(i,j,3)=colors(find(uniq==s(i,j)),3);
end
end
imshow(temp1);