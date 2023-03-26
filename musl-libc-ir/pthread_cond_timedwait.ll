; ModuleID = 'src/thread/pthread_cond_timedwait.c'
source_filename = "src/thread/pthread_cond_timedwait.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_cond_t = type { %union.anon }
%union.anon = type { [6 x i8*] }
%struct.pthread_mutex_t = type { %union.anon.0 }
%union.anon.0 = type { [5 x i8*] }
%struct.timespec = type { i64, i64 }
%struct.waiter = type { %struct.waiter*, %struct.waiter*, i32, i32, i32* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@pthread_cond_timedwait = weak alias i32 (%struct.pthread_cond_t*, %struct.pthread_mutex_t*, %struct.timespec*), i32 (%struct.pthread_cond_t*, %struct.pthread_mutex_t*, %struct.timespec*)* @__pthread_cond_timedwait

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_cond_timedwait(%struct.pthread_cond_t* noalias noundef %0, %struct.pthread_mutex_t* noalias noundef %1, %struct.timespec* noalias noundef %2) #0 {
  %4 = alloca %struct.waiter, align 8
  %5 = alloca i32, align 4
  %6 = bitcast %struct.waiter* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %6, i8 0, i64 32, i1 false) #5
  %7 = bitcast %struct.pthread_cond_t* %0 to [12 x i32]*
  %8 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 2
  %9 = bitcast i8** %8 to i32*
  %10 = load i32, i32* %9, align 8, !tbaa !3
  %11 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #4
  %12 = bitcast %struct.pthread_mutex_t* %1 to [10 x i32]*
  %13 = bitcast %struct.pthread_mutex_t* %1 to i32*
  %14 = load i32, i32* %13, align 8, !tbaa !3
  %15 = and i32 %14, 15
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %26, label %17

17:                                               ; preds = %3
  %18 = getelementptr inbounds [10 x i32], [10 x i32]* %12, i64 0, i64 1
  %19 = load volatile i32, i32* %18, align 4, !tbaa !3
  %20 = and i32 %19, 2147483647
  %21 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !6
  %22 = inttoptr i64 %21 to %struct.__pthread*
  %23 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %22, i64 0, i32 6
  %24 = load i32, i32* %23, align 8, !tbaa !7
  %25 = icmp eq i32 %20, %24
  br i1 %25, label %26, label %258

26:                                               ; preds = %17, %3
  %27 = icmp eq %struct.timespec* %2, null
  br i1 %27, label %32, label %28

28:                                               ; preds = %26
  %29 = getelementptr inbounds %struct.timespec, %struct.timespec* %2, i64 0, i32 1
  %30 = load i64, i64* %29, align 8, !tbaa !13
  %31 = icmp ugt i64 %30, 999999999
  br i1 %31, label %258, label %32

32:                                               ; preds = %28, %26
  tail call void @__pthread_testcancel() #7
  %33 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 0
  %34 = load i8*, i8** %33, align 8, !tbaa !3
  %35 = icmp eq i8* %34, null
  br i1 %35, label %41, label %36

36:                                               ; preds = %32
  %37 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 1
  %38 = bitcast i8** %37 to i32*
  %39 = load volatile i32, i32* %38, align 8, !tbaa !3
  %40 = getelementptr inbounds [12 x i32], [12 x i32]* %7, i64 0, i64 3
  tail call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %40, i32* nonnull elementtype(i32) %40) #4, !srcloc !15
  br label %72

41:                                               ; preds = %32
  %42 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 4
  %43 = bitcast i8** %42 to i32*
  %44 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %43, i32 0, i32 1) #4, !srcloc !16
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %51, label %46

46:                                               ; preds = %41
  %47 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %43, i32 1, i32 2) #4, !srcloc !16
  br label %48

48:                                               ; preds = %48, %46
  tail call void @__wait(i32* noundef nonnull %43, i32* noundef null, i32 noundef 2, i32 noundef 1) #7
  %49 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %43, i32 0, i32 2) #4, !srcloc !16
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %48

51:                                               ; preds = %48, %41
  %52 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 3
  store volatile i32 2, i32* %52, align 4, !tbaa !17
  %53 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 2
  store volatile i32 0, i32* %53, align 8, !tbaa !19
  %54 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 1
  %55 = bitcast i8** %54 to %struct.waiter**
  %56 = load %struct.waiter*, %struct.waiter** %55, align 8, !tbaa !3
  %57 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 1
  store %struct.waiter* %56, %struct.waiter** %57, align 8, !tbaa !20
  store %struct.waiter* %4, %struct.waiter** %55, align 8, !tbaa !3
  %58 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 5
  %59 = load i8*, i8** %58, align 8, !tbaa !3
  %60 = icmp eq i8* %59, null
  %61 = getelementptr inbounds %struct.waiter, %struct.waiter* %56, i64 0, i32 0
  %62 = bitcast i8** %58 to %struct.waiter**
  %63 = select i1 %60, %struct.waiter** %62, %struct.waiter** %61
  store %struct.waiter* %4, %struct.waiter** %63, align 8, !tbaa !3
  %64 = call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %43, i32 0) #4, !srcloc !21
  %65 = icmp eq i32 %64, 2
  br i1 %65, label %66, label %72

66:                                               ; preds = %51
  %67 = ptrtoint i8** %42 to i64
  %68 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %67, i64 129, i64 1) #4, !srcloc !22
  %69 = icmp eq i64 %68, -38
  br i1 %69, label %70, label %72

70:                                               ; preds = %66
  %71 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %67, i64 1, i64 1) #4, !srcloc !22
  br label %72

72:                                               ; preds = %70, %66, %51, %36
  %73 = phi i32 [ %39, %36 ], [ 2, %51 ], [ 2, %66 ], [ 2, %70 ]
  %74 = phi i32* [ %38, %36 ], [ %52, %51 ], [ %52, %66 ], [ %52, %70 ]
  %75 = call i32 @__pthread_mutex_unlock(%struct.pthread_mutex_t* noundef %1) #7
  %76 = call i32 @__pthread_setcancelstate(i32 noundef 2, i32* noundef nonnull %5) #7
  %77 = load i32, i32* %5, align 4, !tbaa !23
  %78 = icmp eq i32 %77, 1
  br i1 %78, label %79, label %81

79:                                               ; preds = %72
  %80 = call i32 @__pthread_setcancelstate(i32 noundef 1, i32* noundef null) #7
  br label %81

81:                                               ; preds = %79, %72
  %82 = zext i1 %35 to i32
  br label %83

83:                                               ; preds = %83, %81
  %84 = call i32 @__timedwait_cp(i32* noundef nonnull %74, i32 noundef %73, i32 noundef %10, %struct.timespec* noundef %2, i32 noundef %82) #7
  %85 = load volatile i32, i32* %74, align 4, !tbaa !23
  %86 = icmp eq i32 %85, %73
  %87 = and i32 %84, -5
  %88 = icmp eq i32 %87, 0
  %89 = select i1 %86, i1 %88, i1 false
  br i1 %89, label %83, label %90

90:                                               ; preds = %83
  %91 = icmp eq i32 %84, 4
  %92 = select i1 %91, i32 0, i32 %84
  br i1 %35, label %112, label %93

93:                                               ; preds = %90
  %94 = icmp eq i32 %92, 125
  br i1 %94, label %95, label %101

95:                                               ; preds = %93
  %96 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 1
  %97 = bitcast i8** %96 to i32*
  %98 = load volatile i32, i32* %97, align 8, !tbaa !3
  %99 = icmp eq i32 %98, %73
  %100 = select i1 %99, i32 125, i32 0
  br label %101

101:                                              ; preds = %95, %93
  %102 = phi i32 [ %92, %93 ], [ %100, %95 ]
  %103 = getelementptr inbounds [12 x i32], [12 x i32]* %7, i64 0, i64 3
  %104 = call i32 asm sideeffect "lock ; xadd $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %103, i32 -1) #4, !srcloc !24
  %105 = icmp eq i32 %104, -2147483647
  br i1 %105, label %106, label %245

106:                                              ; preds = %101
  %107 = ptrtoint i32* %103 to i64
  %108 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %107, i64 1, i64 1) #4, !srcloc !22
  %109 = icmp eq i64 %108, -38
  br i1 %109, label %110, label %245

110:                                              ; preds = %106
  %111 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %107, i64 1, i64 1) #4, !srcloc !22
  br label %245

112:                                              ; preds = %90
  %113 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 2
  %114 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %113, i32 0, i32 2) #4, !srcloc !16
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %181

116:                                              ; preds = %112
  %117 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 4
  %118 = bitcast i8** %117 to i32*
  %119 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %118, i32 0, i32 1) #4, !srcloc !16
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %126, label %121

121:                                              ; preds = %116
  %122 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %118, i32 1, i32 2) #4, !srcloc !16
  br label %123

123:                                              ; preds = %123, %121
  call void @__wait(i32* noundef nonnull %118, i32* noundef null, i32 noundef 2, i32 noundef 1) #7
  %124 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %118, i32 0, i32 2) #4, !srcloc !16
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %123

126:                                              ; preds = %123, %116
  %127 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 1
  %128 = load i8*, i8** %127, align 8, !tbaa !3
  %129 = icmp eq i8* %128, %6
  br i1 %129, label %130, label %134

130:                                              ; preds = %126
  %131 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 1
  %132 = bitcast %struct.waiter** %131 to i8**
  %133 = load i8*, i8** %132, align 8, !tbaa !20
  store i8* %133, i8** %127, align 8, !tbaa !3
  br label %142

134:                                              ; preds = %126
  %135 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 0
  %136 = load %struct.waiter*, %struct.waiter** %135, align 8, !tbaa !25
  %137 = icmp eq %struct.waiter* %136, null
  br i1 %137, label %142, label %138

138:                                              ; preds = %134
  %139 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 1
  %140 = load %struct.waiter*, %struct.waiter** %139, align 8, !tbaa !20
  %141 = getelementptr inbounds %struct.waiter, %struct.waiter* %136, i64 0, i32 1
  store %struct.waiter* %140, %struct.waiter** %141, align 8, !tbaa !20
  br label %142

142:                                              ; preds = %134, %138, %130
  %143 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 5
  %144 = load i8*, i8** %143, align 8, !tbaa !3
  %145 = icmp eq i8* %144, %6
  br i1 %145, label %146, label %149

146:                                              ; preds = %142
  %147 = bitcast %struct.waiter* %4 to i8**
  %148 = load i8*, i8** %147, align 8, !tbaa !25
  store i8* %148, i8** %143, align 8, !tbaa !3
  br label %157

149:                                              ; preds = %142
  %150 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 1
  %151 = load %struct.waiter*, %struct.waiter** %150, align 8, !tbaa !20
  %152 = icmp eq %struct.waiter* %151, null
  br i1 %152, label %157, label %153

153:                                              ; preds = %149
  %154 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 0
  %155 = load %struct.waiter*, %struct.waiter** %154, align 8, !tbaa !25
  %156 = getelementptr inbounds %struct.waiter, %struct.waiter* %151, i64 0, i32 0
  store %struct.waiter* %155, %struct.waiter** %156, align 8, !tbaa !25
  br label %157

157:                                              ; preds = %149, %153, %146
  %158 = call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %118, i32 0) #4, !srcloc !21
  %159 = icmp eq i32 %158, 2
  br i1 %159, label %160, label %166

160:                                              ; preds = %157
  %161 = ptrtoint i8** %117 to i64
  %162 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %161, i64 129, i64 1) #4, !srcloc !22
  %163 = icmp eq i64 %162, -38
  br i1 %163, label %164, label %166

164:                                              ; preds = %160
  %165 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %161, i64 1, i64 1) #4, !srcloc !22
  br label %166

166:                                              ; preds = %157, %160, %164
  %167 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 4
  %168 = load i32*, i32** %167, align 8, !tbaa !26
  %169 = icmp eq i32* %168, null
  br i1 %169, label %245, label %170

170:                                              ; preds = %166
  %171 = call i32 asm sideeffect "lock ; xadd $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %168, i32 -1) #4, !srcloc !24
  %172 = icmp eq i32 %171, 1
  br i1 %172, label %173, label %245

173:                                              ; preds = %170
  %174 = bitcast i32** %167 to i8**
  %175 = load i8*, i8** %174, align 8, !tbaa !26
  %176 = ptrtoint i8* %175 to i64
  %177 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %176, i64 129, i64 1) #4, !srcloc !22
  %178 = icmp eq i64 %177, -38
  br i1 %178, label %179, label %245

179:                                              ; preds = %173
  %180 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %176, i64 1, i64 1) #4, !srcloc !22
  br label %245

181:                                              ; preds = %112
  %182 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 3
  %183 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %182, i32 0, i32 1) #4, !srcloc !16
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %190, label %185

185:                                              ; preds = %181
  %186 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %182, i32 1, i32 2) #4, !srcloc !16
  br label %187

187:                                              ; preds = %187, %185
  call void @__wait(i32* noundef nonnull %182, i32* noundef null, i32 noundef 2, i32 noundef 1) #7
  %188 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %182, i32 0, i32 2) #4, !srcloc !16
  %189 = icmp eq i32 %188, 0
  br i1 %189, label %190, label %187

190:                                              ; preds = %187, %181
  %191 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef %1) #7
  %192 = icmp eq i32 %191, 0
  %193 = select i1 %192, i32 %92, i32 %191
  %194 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 1
  %195 = load %struct.waiter*, %struct.waiter** %194, align 8, !tbaa !20
  %196 = icmp eq %struct.waiter* %195, null
  br i1 %196, label %197, label %204

197:                                              ; preds = %190
  %198 = load i32, i32* %13, align 8, !tbaa !3
  %199 = and i32 %198, 8
  %200 = icmp eq i32 %199, 0
  br i1 %200, label %201, label %204

201:                                              ; preds = %197
  %202 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %1, i64 0, i32 0, i32 0, i64 1
  %203 = bitcast i8** %202 to i32*
  call void asm sideeffect "lock ; incl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %203, i32* nonnull elementtype(i32) %203) #4, !srcloc !15
  br label %204

204:                                              ; preds = %201, %197, %190
  %205 = getelementptr inbounds %struct.waiter, %struct.waiter* %4, i64 0, i32 0
  %206 = load %struct.waiter*, %struct.waiter** %205, align 8, !tbaa !25
  %207 = icmp eq %struct.waiter* %206, null
  br i1 %207, label %234, label %208

208:                                              ; preds = %204
  %209 = getelementptr inbounds [10 x i32], [10 x i32]* %12, i64 0, i64 1
  %210 = load volatile i32, i32* %209, align 4, !tbaa !3
  %211 = icmp sgt i32 %210, 0
  br i1 %211, label %212, label %216

212:                                              ; preds = %208
  %213 = or i32 %210, -2147483648
  %214 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %209, i32 %210, i32 %213) #4, !srcloc !16
  %215 = load %struct.waiter*, %struct.waiter** %205, align 8, !tbaa !25
  br label %216

216:                                              ; preds = %212, %208
  %217 = phi %struct.waiter* [ %215, %212 ], [ %206, %208 ]
  %218 = getelementptr inbounds %struct.waiter, %struct.waiter* %217, i64 0, i32 3
  %219 = load i32, i32* %13, align 8, !tbaa !3
  %220 = and i32 %219, 136
  call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %218, i32 0) #4, !srcloc !27
  %221 = icmp eq i32 %220, 0
  %222 = ptrtoint i32* %218 to i64
  br i1 %221, label %228, label %223

223:                                              ; preds = %216
  %224 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %222, i64 129, i64 1) #4, !srcloc !22
  %225 = icmp eq i64 %224, -38
  br i1 %225, label %226, label %241

226:                                              ; preds = %223
  %227 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %222, i64 1, i64 1) #4, !srcloc !22
  br label %241

228:                                              ; preds = %216
  %229 = ptrtoint i32* %209 to i64
  %230 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %222, i64 131, i64 0, i64 1, i64 %229) #4, !srcloc !28
  %231 = icmp eq i64 %230, -38
  br i1 %231, label %232, label %241

232:                                              ; preds = %228
  %233 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %222, i64 3, i64 0, i64 1, i64 %229) #4, !srcloc !28
  br label %241

234:                                              ; preds = %204
  %235 = load i32, i32* %13, align 8, !tbaa !3
  %236 = and i32 %235, 8
  %237 = icmp eq i32 %236, 0
  br i1 %237, label %238, label %241

238:                                              ; preds = %234
  %239 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %1, i64 0, i32 0, i32 0, i64 1
  %240 = bitcast i8** %239 to i32*
  call void asm sideeffect "lock ; decl $0", "=*m,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %240, i32* nonnull elementtype(i32) %240) #4, !srcloc !29
  br label %241

241:                                              ; preds = %232, %228, %226, %223, %234, %238
  %242 = icmp eq i32 %193, 125
  %243 = select i1 %242, i32 0, i32 %193
  %244 = load i32, i32* %5, align 4, !tbaa !23
  br label %254

245:                                              ; preds = %170, %166, %101, %106, %110, %173, %179
  %246 = phi i32 [ %92, %179 ], [ %92, %173 ], [ %102, %110 ], [ %102, %106 ], [ %102, %101 ], [ %92, %166 ], [ %92, %170 ]
  %247 = call i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef %1) #7
  %248 = icmp eq i32 %247, 0
  %249 = select i1 %248, i32 %246, i32 %247
  %250 = load i32, i32* %5, align 4, !tbaa !23
  %251 = call i32 @__pthread_setcancelstate(i32 noundef %250, i32* noundef null) #7
  %252 = icmp eq i32 %249, 125
  br i1 %252, label %253, label %258

253:                                              ; preds = %245
  call void @__pthread_testcancel() #7
  br label %254

254:                                              ; preds = %253, %241
  %255 = phi i32 [ %244, %241 ], [ 1, %253 ]
  %256 = phi i32 [ %243, %241 ], [ 125, %253 ]
  %257 = call i32 @__pthread_setcancelstate(i32 noundef %255, i32* noundef null) #7
  br label %258

258:                                              ; preds = %254, %245, %28, %17
  %259 = phi i32 [ 1, %17 ], [ 22, %28 ], [ %249, %245 ], [ %256, %254 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #4
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #4
  ret i32 %259
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare hidden void @__pthread_testcancel() local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__pthread_mutex_unlock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__timedwait_cp(i32* noundef, i32 noundef, i32 noundef, %struct.timespec* noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_mutex_lock(%struct.pthread_mutex_t* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__private_cond_signal(%struct.pthread_cond_t* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #4
  store volatile i32 0, i32* %3, align 4, !tbaa !23
  %5 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 4
  %6 = bitcast i8** %5 to i32*
  %7 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %6, i32 0, i32 1) #4, !srcloc !16
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %2
  %10 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %6, i32 1, i32 2) #4, !srcloc !16
  br label %11

11:                                               ; preds = %11, %9
  tail call void @__wait(i32* noundef nonnull %6, i32* noundef null, i32 noundef 2, i32 noundef 1) #7
  %12 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %6, i32 0, i32 2) #4, !srcloc !16
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %11

14:                                               ; preds = %11, %2
  %15 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 5
  %16 = bitcast i8** %15 to %struct.waiter**
  %17 = load %struct.waiter*, %struct.waiter** %16, align 8, !tbaa !3
  %18 = icmp ne i32 %1, 0
  %19 = icmp ne %struct.waiter* %17, null
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %44

21:                                               ; preds = %14, %36
  %22 = phi %struct.waiter* [ %40, %36 ], [ %17, %14 ]
  %23 = phi i32 [ %38, %36 ], [ %1, %14 ]
  %24 = phi %struct.waiter* [ %37, %36 ], [ null, %14 ]
  %25 = getelementptr inbounds %struct.waiter, %struct.waiter* %22, i64 0, i32 2
  %26 = call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %25, i32 0, i32 1) #4, !srcloc !16
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %32, label %28

28:                                               ; preds = %21
  %29 = load volatile i32, i32* %3, align 4, !tbaa !23
  %30 = add nsw i32 %29, 1
  store volatile i32 %30, i32* %3, align 4, !tbaa !23
  %31 = getelementptr inbounds %struct.waiter, %struct.waiter* %22, i64 0, i32 4
  store i32* %3, i32** %31, align 8, !tbaa !26
  br label %36

32:                                               ; preds = %21
  %33 = add nsw i32 %23, -1
  %34 = icmp eq %struct.waiter* %24, null
  %35 = select i1 %34, %struct.waiter* %22, %struct.waiter* %24
  br label %36

36:                                               ; preds = %32, %28
  %37 = phi %struct.waiter* [ %24, %28 ], [ %35, %32 ]
  %38 = phi i32 [ %23, %28 ], [ %33, %32 ]
  %39 = getelementptr inbounds %struct.waiter, %struct.waiter* %22, i64 0, i32 0
  %40 = load %struct.waiter*, %struct.waiter** %39, align 8, !tbaa !3
  %41 = icmp ne i32 %38, 0
  %42 = icmp ne %struct.waiter* %40, null
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %21, label %44

44:                                               ; preds = %36, %14
  %45 = phi %struct.waiter* [ null, %14 ], [ %37, %36 ]
  %46 = phi %struct.waiter* [ %17, %14 ], [ %40, %36 ]
  %47 = phi i1 [ %19, %14 ], [ %42, %36 ]
  br i1 %47, label %48, label %55

48:                                               ; preds = %44
  %49 = getelementptr inbounds %struct.waiter, %struct.waiter* %46, i64 0, i32 1
  %50 = load %struct.waiter*, %struct.waiter** %49, align 8, !tbaa !20
  %51 = icmp eq %struct.waiter* %50, null
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = getelementptr inbounds %struct.waiter, %struct.waiter* %50, i64 0, i32 0
  store %struct.waiter* null, %struct.waiter** %53, align 8, !tbaa !25
  br label %54

54:                                               ; preds = %52, %48
  store %struct.waiter* null, %struct.waiter** %49, align 8, !tbaa !20
  br label %57

55:                                               ; preds = %44
  %56 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 1
  store i8* null, i8** %56, align 8, !tbaa !3
  br label %57

57:                                               ; preds = %55, %54
  store %struct.waiter* %46, %struct.waiter** %16, align 8, !tbaa !3
  %58 = call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %6, i32 0) #4, !srcloc !21
  %59 = icmp eq i32 %58, 2
  br i1 %59, label %60, label %66

60:                                               ; preds = %57
  %61 = ptrtoint i8** %5 to i64
  %62 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %61, i64 129, i64 1) #4, !srcloc !22
  %63 = icmp eq i64 %62, -38
  br i1 %63, label %64, label %66

64:                                               ; preds = %60
  %65 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %61, i64 1, i64 1) #4, !srcloc !22
  br label %66

66:                                               ; preds = %57, %60, %64
  %67 = load volatile i32, i32* %3, align 4, !tbaa !23
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %73, label %69

69:                                               ; preds = %66, %69
  %70 = phi i32 [ %71, %69 ], [ %67, %66 ]
  call void @__wait(i32* noundef nonnull %3, i32* noundef null, i32 noundef %70, i32 noundef 1) #7
  %71 = load volatile i32, i32* %3, align 4, !tbaa !23
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %69

73:                                               ; preds = %69, %66
  %74 = icmp eq %struct.waiter* %45, null
  br i1 %74, label %85, label %75

75:                                               ; preds = %73
  %76 = getelementptr inbounds %struct.waiter, %struct.waiter* %45, i64 0, i32 3
  %77 = call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %76, i32 0) #4, !srcloc !21
  %78 = icmp eq i32 %77, 2
  br i1 %78, label %79, label %85

79:                                               ; preds = %75
  %80 = ptrtoint i32* %76 to i64
  %81 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %80, i64 129, i64 1) #4, !srcloc !22
  %82 = icmp eq i64 %81, -38
  br i1 %82, label %83, label %85

83:                                               ; preds = %79
  %84 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %80, i64 1, i64 1) #4, !srcloc !22
  br label %85

85:                                               ; preds = %83, %79, %75, %73
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #4
  ret i32 0
}

; Function Attrs: optsize
declare hidden void @__wait(i32* noundef, i32* noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nounwind readnone strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 239493}
!7 = !{!8, !11, i64 48}
!8 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !4, i64 64, !4, i64 65, !4, i64 66, !4, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !9, i64 168, !4, i64 176, !9, i64 184, !9, i64 192}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"long", !4, i64 0}
!11 = !{!"int", !4, i64 0}
!12 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!13 = !{!14, !10, i64 8}
!14 = !{!"timespec", !10, i64 0, !10, i64 8}
!15 = !{i64 237874}
!16 = !{i64 236469}
!17 = !{!18, !11, i64 20}
!18 = !{!"waiter", !9, i64 0, !9, i64 8, !11, i64 16, !11, i64 20, !9, i64 24}
!19 = !{!18, !11, i64 16}
!20 = !{!18, !9, i64 8}
!21 = !{i64 236869}
!22 = !{i64 209376}
!23 = !{!11, !11, i64 0}
!24 = !{i64 237055}
!25 = !{!18, !9, i64 0}
!26 = !{!18, !9, i64 24}
!27 = !{i64 238179}
!28 = !{i64 209972}
!29 = !{i64 238020}
