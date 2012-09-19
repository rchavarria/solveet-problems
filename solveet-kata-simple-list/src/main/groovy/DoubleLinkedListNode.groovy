
class DoubleLinkedListNode {

    String value
    DoubleLinkedListNode previousNode
    DoubleLinkedListNode nextNode
    
    def is(String otherValue) {
        otherValue.equals(value)
    }
    
    def find(String nodeValue){
        if(is(nodeValue)){
            return value
        }
        
        return (nextNode != null) ? nextNode.find(nodeValue) : null
    }
    
    def add(String newValue){
        if(nextNode == null){
            nextNode = new DoubleLinkedListNode(value: newValue)
            nextNode.previousNode = this
        } else {
            nextNode.add(newValue)
        }
    }
    
    def collectValues(def collectThis){
        collectThis(this)
        nextNode?.collectValues(collectThis)
    }
    
    def delete(String deleteValue){
        if(is(deleteValue)){
            nextNode?.previousNode = previousNode
            previousNode?.nextNode = nextNode
            return
        }
        
        nextNode?.delete(deleteValue)
    }
}
