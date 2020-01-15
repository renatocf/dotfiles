# Defined in - @ line 1
function k8s-config-sa --description 'alias k8s-config-sa=rm -rf /home/renatocf/.kube && /home/renatocf/dev/dotfiles/scripts/k8s/configure-k8s.sh'
	rm -rf /home/renatocf/.kube && /home/renatocf/dev/dotfiles/scripts/k8s/configure-k8s.sh $argv;
end
