Plot the raw, small files.
++++++++++++++++++++++++++++++++
file_list = []
for file in os.listdir('.'):
    if file.endswith('.csv'):
	file_list.append(file)

i = 0
for file in file_list:
    name = os.path.basename(file)[0]
    data = pd.read_csv(file, header=False)
    scaled_sub = data['b']/1.5
    plot = ggplot(aes(x=data['a'],y=scaled_sub), data=data) + geom_point() + stat_smooth(color='blue', se=True) + ylab("Average Transition Rate") + xlab("Topological Error") +ylim(0,100) + xlim(2,3) + geom_hline(y=98.7) +theme_bw()
    ggsave(plot, name, 'png')
    i = i+1


Plot the combined data sets.
+++++++++++++++++++++++++++++++++
    datacomb = pd.read_csv('mk.csv', header=False)
    scaled_subcomb = datacomb['b']/1.5
    col = datacomb['e']
    plot = ggplot(aes(x=datacomb['a'],y=scaled_subcomb, color='e'), data=datacomb) + geom_point() + stat_smooth(color='blue', se=True, byfactor='e') +  ylab("Average Transition Rate") + xlab("Topological Error") +ylim(0,100) + xlim(2,3) + geom_hline(y=98.7, color='black') +theme_bw()
    ggsave(plot, 'comb', 'png')
  
