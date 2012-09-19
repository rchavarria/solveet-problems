
class LinkedListNode {

    String value
    LinkedListNode nextNode
    
    def is(String otherValue) {
        otherValue.equals(value)
    }
    
    def find(String otherValue){
        if(is(otherValue)){
            return value
        }
        
        return (nextNode != null) ? nextNode.find(otherValue) : null
    }
    
    def add(String newValue){
        if(nextNode == null){
            nextNode = new LinkedListNode(value: newValue)
        } else {
            nextNode.add(newValue)
        }
    }
    
    def collectValues(def collectThis){
        collectThis(this)
        nextNode?.collectValues(collectThis)
    }
}
