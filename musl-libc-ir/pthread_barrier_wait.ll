; ModuleID = 'src/thread/pthread_barrier_wait.c'
source_filename = "src/thread/pthread_barrier_wait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_barrier_t = type { %union.anon }
%union.anon = type { [4 x i8*] }
%struct.instance = type { i32, i32, i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_barrier_wait(%struct.pthread_barrier_t* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.instance, align 4
  %3 = bitcast %struct.pthread_barrier_t* %0 to [8 x i32]*
  %4 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 1
  %5 = bitcast i8** %4 to i32*
  %6 = load i32, i32* %5, align 8, !tbaa !3
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %208, label %8

8:                                                ; preds = %1
  %9 = icmp slt i32 %6, 0
  br i1 %9, label %16, label %10

10:                                               ; preds = %8
  %11 = bitcast %struct.pthread_barrier_t* %0 to i32*
  %12 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %11, i32 1) #4, !srcloc !6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %117, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  br label %114

16:                                               ; preds = %8
  %17 = and i32 %6, 2147483647
  %18 = add nuw nsw i32 %17, 1
  %19 = icmp eq i32 %17, 0
  br i1 %19, label %208, label %20

20:                                               ; preds = %16
  %21 = bitcast %struct.pthread_barrier_t* %0 to i32*
  %22 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %21, i32 0, i32 %18) #4, !srcloc !7
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %30, label %24

24:                                               ; preds = %20
  %25 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi i32 [ %22, %24 ], [ %28, %26 ]
  tail call void @__wait(i32* noundef %21, i32* noundef nonnull %25, i32 noundef %27, i32 noundef 0) #5
  %28 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %21, i32 0, i32 %18) #4, !srcloc !7
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %26

30:                                               ; preds = %26, %20
  %31 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 3
  %32 = load volatile i32, i32* %31, align 4, !tbaa !3
  %33 = add nsw i32 %32, 1
  store volatile i32 %33, i32* %31, align 4, !tbaa !3
  %34 = icmp eq i32 %32, %17
  br i1 %34, label %35, label %46

35:                                               ; preds = %30
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %31, i32 0) #4, !srcloc !8
  %36 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 2
  %37 = bitcast i8** %36 to i32*
  %38 = load volatile i32, i32* %37, align 8, !tbaa !3
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %66, label %40

40:                                               ; preds = %35
  %41 = ptrtoint i32* %31 to i64
  %42 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %41, i64 1, i64 2147483647) #4, !srcloc !9
  %43 = icmp eq i64 %42, -38
  br i1 %43, label %44, label %66

44:                                               ; preds = %40
  %45 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %41, i64 1, i64 2147483647) #4, !srcloc !9
  br label %66

46:                                               ; preds = %30
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %21, i32 0) #4, !srcloc !8
  %47 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  %48 = load volatile i32, i32* %47, align 4, !tbaa !3
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %56, label %50

50:                                               ; preds = %46
  %51 = ptrtoint %struct.pthread_barrier_t* %0 to i64
  %52 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %51, i64 1, i64 1) #4, !srcloc !9
  %53 = icmp eq i64 %52, -38
  br i1 %53, label %54, label %56

54:                                               ; preds = %50
  %55 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %51, i64 1, i64 1) #4, !srcloc !9
  br label %56

56:                                               ; preds = %54, %50, %46
  %57 = load volatile i32, i32* %31, align 4, !tbaa !3
  %58 = icmp sgt i32 %57, 0
  br i1 %58, label %59, label %66

59:                                               ; preds = %56
  %60 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 2
  %61 = bitcast i8** %60 to i32*
  br label %62

62:                                               ; preds = %62, %59
  %63 = phi i32 [ %57, %59 ], [ %64, %62 ]
  tail call void @__wait(i32* noundef nonnull %31, i32* noundef nonnull %61, i32 noundef %63, i32 noundef 0) #5
  %64 = load volatile i32, i32* %31, align 4, !tbaa !3
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %62, label %66

66:                                               ; preds = %62, %56, %44, %40, %35
  %67 = phi i32 [ -1, %35 ], [ -1, %40 ], [ -1, %44 ], [ 0, %56 ], [ 0, %62 ]
  tail call void @__vm_lock() #5
  %68 = tail call i32 asm sideeffect "lock ; xadd $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %31, i32 -1) #4, !srcloc !10
  %69 = sub nsw i32 0, %17
  %70 = icmp eq i32 %68, %69
  br i1 %70, label %77, label %71

71:                                               ; preds = %66
  %72 = load volatile i32, i32* %31, align 4, !tbaa !3
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %92, label %74

74:                                               ; preds = %71
  %75 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 2
  %76 = bitcast i8** %75 to i32*
  br label %88

77:                                               ; preds = %66
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %31, i32 0) #4, !srcloc !8
  %78 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 2
  %79 = bitcast i8** %78 to i32*
  %80 = load volatile i32, i32* %79, align 8, !tbaa !3
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %92, label %82

82:                                               ; preds = %77
  %83 = ptrtoint i32* %31 to i64
  %84 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %83, i64 1, i64 2147483647) #4, !srcloc !9
  %85 = icmp eq i64 %84, -38
  br i1 %85, label %86, label %92

86:                                               ; preds = %82
  %87 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %83, i64 1, i64 2147483647) #4, !srcloc !9
  br label %92

88:                                               ; preds = %88, %74
  %89 = phi i32 [ %72, %74 ], [ %90, %88 ]
  tail call void @__wait(i32* noundef nonnull %31, i32* noundef nonnull %76, i32 noundef %89, i32 noundef 0) #5
  %90 = load volatile i32, i32* %31, align 4, !tbaa !3
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %88

92:                                               ; preds = %88, %86, %82, %77, %71
  %93 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  br label %94

94:                                               ; preds = %94, %92
  %95 = load volatile i32, i32* %21, align 8, !tbaa !3
  %96 = load volatile i32, i32* %93, align 4, !tbaa !3
  %97 = icmp eq i32 %95, -2147483647
  %98 = add nsw i32 %95, -1
  %99 = select i1 %97, i32 0, i32 %98
  %100 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %21, i32 %95, i32 %99) #4, !srcloc !7
  %101 = icmp eq i32 %100, %95
  br i1 %101, label %102, label %94

102:                                              ; preds = %94
  br i1 %97, label %107, label %103

103:                                              ; preds = %102
  %104 = icmp eq i32 %95, 1
  %105 = icmp ne i32 %96, 0
  %106 = select i1 %104, i1 %105, i1 false
  br i1 %106, label %107, label %113

107:                                              ; preds = %103, %102
  %108 = ptrtoint %struct.pthread_barrier_t* %0 to i64
  %109 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %108, i64 1, i64 1) #4, !srcloc !9
  %110 = icmp eq i64 %109, -38
  br i1 %110, label %111, label %113

111:                                              ; preds = %107
  %112 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %108, i64 1, i64 1) #4, !srcloc !9
  br label %113

113:                                              ; preds = %111, %107, %103
  tail call void @__vm_unlock() #5
  br label %208

114:                                              ; preds = %14, %114
  tail call void @__wait(i32* noundef %11, i32* noundef nonnull %15, i32 noundef 1, i32 noundef 1) #5
  %115 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) %11, i32 1) #4, !srcloc !6
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %114

117:                                              ; preds = %114, %10
  %118 = getelementptr inbounds %struct.pthread_barrier_t, %struct.pthread_barrier_t* %0, i64 0, i32 0, i32 0, i64 3
  %119 = bitcast i8** %118 to %struct.instance**
  %120 = load %struct.instance*, %struct.instance** %119, align 8, !tbaa !3
  %121 = icmp eq %struct.instance* %120, null
  br i1 %121, label %122, label %156

122:                                              ; preds = %117
  %123 = bitcast %struct.instance* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %123) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %123, i8 0, i64 16, i1 false) #6
  store %struct.instance* %2, %struct.instance** %119, align 8, !tbaa !3
  call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %11, i32 0) #4, !srcloc !8
  %124 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  %125 = load volatile i32, i32* %124, align 4, !tbaa !3
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %133, label %127

127:                                              ; preds = %122
  %128 = ptrtoint %struct.pthread_barrier_t* %0 to i64
  %129 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %128, i64 129, i64 1) #4, !srcloc !9
  %130 = icmp eq i64 %129, -38
  br i1 %130, label %131, label %133

131:                                              ; preds = %127
  %132 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %128, i64 1, i64 1) #4, !srcloc !9
  br label %133

133:                                              ; preds = %131, %127, %122
  %134 = getelementptr inbounds %struct.instance, %struct.instance* %2, i64 0, i32 3
  br label %135

135:                                              ; preds = %133, %139
  %136 = phi i32 [ 199, %133 ], [ %140, %139 ]
  %137 = load volatile i32, i32* %134, align 4, !tbaa !11
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %142

139:                                              ; preds = %135
  call void asm sideeffect "pause", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !14
  %140 = add nsw i32 %136, -1
  %141 = icmp eq i32 %136, 0
  br i1 %141, label %142, label %135

142:                                              ; preds = %139, %135
  call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %134, i32* nonnull elementtype(i32) %134) #4, !srcloc !15
  %143 = load volatile i32, i32* %134, align 4, !tbaa !11
  %144 = icmp eq i32 %143, 1
  br i1 %144, label %145, label %155

145:                                              ; preds = %142
  %146 = ptrtoint i32* %134 to i64
  br label %147

147:                                              ; preds = %145, %152
  %148 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %146, i64 128, i64 1, i64 0) #4, !srcloc !16
  %149 = icmp eq i64 %148, -38
  br i1 %149, label %150, label %152

150:                                              ; preds = %147
  %151 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %146, i64 0, i64 1, i64 0) #4, !srcloc !16
  br label %152

152:                                              ; preds = %150, %147
  %153 = load volatile i32, i32* %134, align 4, !tbaa !11
  %154 = icmp eq i32 %153, 1
  br i1 %154, label %147, label %155

155:                                              ; preds = %152, %142
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %123) #4
  br label %208

156:                                              ; preds = %117
  %157 = getelementptr inbounds %struct.instance, %struct.instance* %120, i64 0, i32 0
  %158 = load volatile i32, i32* %157, align 4, !tbaa !17
  %159 = add nsw i32 %158, 1
  store volatile i32 %159, i32* %157, align 4, !tbaa !17
  %160 = icmp eq i32 %159, %6
  br i1 %160, label %161, label %182

161:                                              ; preds = %156
  store i8* null, i8** %118, align 8, !tbaa !3
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %11, i32 0) #4, !srcloc !8
  %162 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  %163 = load volatile i32, i32* %162, align 4, !tbaa !3
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %171, label %165

165:                                              ; preds = %161
  %166 = ptrtoint %struct.pthread_barrier_t* %0 to i64
  %167 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %166, i64 129, i64 1) #4, !srcloc !9
  %168 = icmp eq i64 %167, -38
  br i1 %168, label %169, label %171

169:                                              ; preds = %165
  %170 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %166, i64 1, i64 1) #4, !srcloc !9
  br label %171

171:                                              ; preds = %169, %165, %161
  %172 = getelementptr inbounds %struct.instance, %struct.instance* %120, i64 0, i32 1
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %172, i32 1) #4, !srcloc !8
  %173 = getelementptr inbounds %struct.instance, %struct.instance* %120, i64 0, i32 2
  %174 = load volatile i32, i32* %173, align 4, !tbaa !18
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %195, label %176

176:                                              ; preds = %171
  %177 = ptrtoint i32* %172 to i64
  %178 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %177, i64 129, i64 2147483647) #4, !srcloc !9
  %179 = icmp eq i64 %178, -38
  br i1 %179, label %180, label %195

180:                                              ; preds = %176
  %181 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %177, i64 1, i64 2147483647) #4, !srcloc !9
  br label %195

182:                                              ; preds = %156
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %11, i32 0) #4, !srcloc !8
  %183 = getelementptr inbounds [8 x i32], [8 x i32]* %3, i64 0, i64 1
  %184 = load volatile i32, i32* %183, align 4, !tbaa !3
  %185 = icmp eq i32 %184, 0
  br i1 %185, label %192, label %186

186:                                              ; preds = %182
  %187 = ptrtoint %struct.pthread_barrier_t* %0 to i64
  %188 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %187, i64 129, i64 1) #4, !srcloc !9
  %189 = icmp eq i64 %188, -38
  br i1 %189, label %190, label %192

190:                                              ; preds = %186
  %191 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %187, i64 1, i64 1) #4, !srcloc !9
  br label %192

192:                                              ; preds = %190, %186, %182
  %193 = getelementptr inbounds %struct.instance, %struct.instance* %120, i64 0, i32 1
  %194 = getelementptr inbounds %struct.instance, %struct.instance* %120, i64 0, i32 2
  tail call void @__wait(i32* noundef nonnull %193, i32* noundef nonnull %194, i32 noundef 0, i32 noundef 1) #5
  br label %195

195:                                              ; preds = %180, %176, %171, %192
  %196 = tail call i32 asm sideeffect "lock ; xadd $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %157, i32 -1) #4, !srcloc !10
  %197 = icmp eq i32 %196, 1
  br i1 %197, label %198, label %208

198:                                              ; preds = %195
  %199 = getelementptr inbounds %struct.instance, %struct.instance* %120, i64 0, i32 3
  %200 = tail call i32 asm sideeffect "lock ; xadd $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %199, i32 1) #4, !srcloc !10
  %201 = icmp eq i32 %200, 0
  br i1 %201, label %208, label %202

202:                                              ; preds = %198
  %203 = ptrtoint i32* %199 to i64
  %204 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %203, i64 129, i64 1) #4, !srcloc !9
  %205 = icmp eq i64 %204, -38
  br i1 %205, label %206, label %208

206:                                              ; preds = %202
  %207 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %203, i64 1, i64 1) #4, !srcloc !9
  br label %208

208:                                              ; preds = %206, %202, %113, %16, %195, %198, %1, %155
  %209 = phi i32 [ -1, %155 ], [ -1, %1 ], [ 0, %198 ], [ 0, %195 ], [ %67, %113 ], [ -1, %16 ], [ 0, %202 ], [ 0, %206 ]
  ret i32 %209
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__wait(i32* noundef, i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__vm_lock() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__vm_unlock() local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 234314}
!7 = !{i64 233914}
!8 = !{i64 235624}
!9 = !{i64 206821}
!10 = !{i64 234500}
!11 = !{!12, !13, i64 12}
!12 = !{!"instance", !13, i64 0, !13, i64 4, !13, i64 8, !13, i64 12}
!13 = !{!"int", !4, i64 0}
!14 = !{i64 235883}
!15 = !{i64 235319}
!16 = !{i64 207091}
!17 = !{!12, !13, i64 0}
!18 = !{!12, !13, i64 8}
