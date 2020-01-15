# Defined in - @ line 1
function k8s-config-us --description 'alias k8s-config-us=rm -rf /home/renatocf/.kube && /home/renatocf/dev/dotfiles/scripts/k8s/configure-k8s-us.sh'
	rm -rf /home/renatocf/.kube && /home/renatocf/dev/dotfiles/scripts/k8s/configure-k8s-us.sh $argv;
end
