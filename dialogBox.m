function [ answer ] = dialogBox( input )
%dialogBox asks a string to the user and returns it in a cell

prompt = {'Enter your message'};
dlg_title = 'Message';
num_lines = 1;
def = {''};
answer = inputdlg(prompt,dlg_title,num_lines,def);

end

